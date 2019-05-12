# Cryptocurrency
Information about favourite coins and tokens

## Running the program
./crypto.sh [OPTIONS]

### OPTIONS
* -a __list__ . add __list__ of currencies into your favourite
* -r __list__ . remove __list__ of currencies from your favourite
* -c __currency__ . convert results to __currency__

__list__ is list of cryptocurrencies separated by comma. It has to be lowercase and spaces has to be replaced by dash. E.g. ethereum,bitcoin-cash


OPTIONS:

    -a list
        length of interval between tests
        format: -t qu, where q is quantity and u is time unit
        accepted units: 's' (seconds),'m' (minutes), 'h' (hours), 'd' (days)
        (default unit: seconds)
        default: 1h
        
    -r list
        email address(es), which the notification will be sent on
        format: -m mail1@domain1 ... mailN@domainN
        where can be N mail addresses separated by space
        default: no mail will be send
        
    -c currency
        determines, what the mail notification will contain
        format: -mc options
        where options are either "diff" or "time" or
        both separated by comma (without space!)
        diff - the mail will contain diff of change
        time - the mail will contain time of detecti
       
    -s column
        ashojas
        aoskaoksa
