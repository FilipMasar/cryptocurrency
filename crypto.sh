#!/bin/bash
set -euo pipefail

# TABLE functions
function printTable()
{
    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                # Add Header Or Body

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}

function removeEmptyLines()
{
    local -r content="${1}"

    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString()
{
    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString()
{
    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString()
{
    local -r string="${1}"

    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}

usage() {

	echo "NAME
    crypto.sh -- nformation about your favourite coins and tokens

SYNOPSIS
    ./crypto.sh [OPTIONS]

OPTIONS

    -a list
        optional
        add list of currencies into your favourite
        list of cryptocurrencies has to be separated by comma
        it has to be lowercase and spaces has to be replaced by dash
        Example: -a ethereum,bitcoin-cash
        
    -r list
        optional
        remove list of currencies from your favourite
        list of cryptocurrencies has to be separated by comma
        it has to be lowercase and spaces has to be replaced by dash
        Example: -a cardano,bitcoin-cash,ripple
        
    -c currency
        optional. By defaul set to USD
        calculate market quotes in specified currency
        Example: -c EUR
        
       
    -s column
        optional. By defaul set to PRICE
        sort data by column.
        Supported column - PRICE, HOUR, DAY, WEEK

EXAMPLES
    The following is how to add bitcoin and ethereum and show info converted to EUR
        
        ./crypto.sh -a bitcoin,ethereum -c EUR

    The following is how to remove litecoin from favourite
    and print info sorted by the 24 hour change
        
        ./crypto.sh -r litecoin -s DAY

SEE ALSO
    cat README.md
"
	exit 1
}

key="0dcdfd80-d059-40d2-87f8-804952135be5"
convert="USD"
sortBy=3

if [ ! -d "tmp" ]; then
	mkdir tmp
fi
if [ ! -d "tmp/info" ]; then
	mkdir tmp/info
fi

add() {
	for coin in $(echo $1 | tr "," "\n"); do
		# check if not already in favourite
		if [ -f "favourite" ]; then
			alreadyIn=0
			for line in $(cat favourite); do
				slug=$(echo "$line" | cut -d ',' -f 1)
				if [ "$coin" == "$slug" ]; then
					alreadyIn=1
					break
				fi
			done;	
			if [ $alreadyIn -eq 1 ]; then
				continue
			fi
		fi

		# add to favourite
		curl -s -H "X-CMC_PRO_API_KEY: $key" \
			-H "Accept: application/json" \
			-d "slug=$coin" \
			-G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest \
			--output "tmp/$coin"

		num=$(cat "tmp/$coin" | wc -l)
		if [ $num -lt 12 ]; then
			echo "$coin is invalid name for cryptocurrency!";
			continue
		fi

		printf "$coin," >> favourite
		cat "tmp/$coin" | grep id | head -1 |
			sed 's/.*: \(.*\),/\1/' >> favourite
	done
}

remove() {
	for coin in $(echo $1 | tr "," "\n"); do
		# check if in favourite
		if [ -f "favourite" ]; then
			awk '!/'"$coin"',.*/' favourite > tempF && mv tempF favourite
		fi
	done
}


# parse arguments
while getopts :a:r:c:s: name; do
	case $name in
	a)
		add $OPTARG
		;;
	r)
		remove $OPTARG
		;;
	c)
		convert="$OPTARG"
		;;
	s)
		if [ "$OPTARG" == "PRICE" ]; then
			sortBy="3"
		elif [ "$OPTARG" == "HOUR" ]; then
			sortBy="4"
		elif [ "$OPTARG" == "DAY" ]; then
			sortBy="5"
		elif [ "$OPTARG" == "WEEK" ]; then
			sortBy="6"
		else
			echo "Invalid option argument. Sorted defaultly by price."
		fi
		;;
	\?)
		usage
		;;
	esac
done
shift $(expr $OPTIND - 1)


# MAIN

# if there is no crypto to show
if [ ! -f "favourite" ]; then
	echo "No cryptocurrency to show. Please add some with -a OPTION"
	exit 1
fi
text=$(cat favourite)
if [ "$text" == "" ]; then
	echo "No cryptocurrency to show. Please add some with -a OPTION"
	exit 1
fi

# Info about favourite crypto
for id in $(cat favourite | cut -d ',' -f 2); do
	curl -s -H "X-CMC_PRO_API_KEY: $key" \
		-H "Accept: application/json" \
		-d "id="$id"&convert="$convert"" \
		-G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest \
		--output "tmp/info/$id"
done;

for file in tmp/info/*; do
	name=$(cat $file | grep name | head -1 | sed 's/.*: "\(.*\)",/\1/')
	symbol=$(cat $file | grep symbol | head -1 | sed 's/.*: "\(.*\)",/\1/')
	price=$(cat $file | grep price | sed 's/.*: \(.*\),/\1/')
	one=$(cat $file | grep percent_change_1h | sed 's/.*: \(.*\),/\1/')
	twenty=$(cat $file | grep percent_change_24h | sed 's/.*: \(.*\),/\1/')
	seven=$(cat $file | grep percent_change_7d | sed 's/.*: \(.*\),/\1/')

	# trim
	price=$(echo "$price" | sed 's/\(.*\....\).*/\1/')
	one=$(echo "$one" | sed 's/\(.*\...\).*/\1/')
	twenty=$(echo "$twenty" | sed 's/\(.*\...\).*/\1/')
	seven=$(echo "$seven" | sed 's/\(.*\...\).*/\1/')

	echo "$name,$symbol,$price,$one,$twenty,$seven" >> tmp/data
done;

echo "Name,Symbol,Price [$convert],1h change,24h change,7d change" > tmp/table

# sort
cat tmp/data | awk 'BEGIN {FS=","} {print $'"$sortBy"' " " $0;}' | sort -nr |
	cut -d ' ' -f 2- >> tmp/table

# print table
printTable ',' "$(cat tmp/table)"

# clearing
rm -R tmp

