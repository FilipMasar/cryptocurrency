# Cryptocurrency
Information about your favourite coins and tokens

## Running the program
./crypto.sh [OPTIONS]

### OPTIONS


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
        




### Supported currencies for calculating market quotes

<table>
<thead>
<tr><th>Currency</th><th>Currency Code</th></tr>
</thead>
<tbody>
<tr><td>United States Dollar ($)</td><td>USD</td></tr>
<tr><td>Albanian Lek (L)</td><td>ALL</td></tr>
<tr><td>Algerian Dinar (د.ج)</td><td>DZD</td></tr>
<tr><td>Argentine Peso ($)</td><td>ARS</td></tr>
<tr><td>Armenian Dram (֏)</td><td>AMD</td></tr>
<tr><td>Australian Dollar ($)</td><td>AUD</td></tr>
<tr><td>Azerbaijani Manat (₼)</td><td>AZN</td></tr>
<tr><td>Bahraini Dinar (.د.ب)</td><td>BHD</td></tr>
<tr><td>Bangladeshi Taka (৳)</td><td>BDT</td></tr>
<tr><td>Belarusian Ruble (Br)</td><td>BYN</td></tr>
<tr><td>Bermudan Dollar ($)</td><td>BMD</td></tr>
<tr><td>Bolivian Boliviano (Bs.)</td><td>BOB</td></tr>
<tr><td>Bosnia-Herzegovina Convertible Mark (KM)</td><td>BAM</td></tr>
<tr><td>Brazilian Real (R$)</td><td>BRL</td></tr>
<tr><td>Bulgarian Lev (лв)</td><td>BGN</td></tr>
<tr><td>Cambodian Riel (៛)</td><td>KHR</td></tr>
<tr><td>Canadian Dollar ($)</td><td>CAD</td></tr>
<tr><td>Chilean Peso ($)</td><td>CLP</td></tr>
<tr><td>Chinese Yuan (¥)</td><td>CNY</td></tr>
<tr><td>Colombian Peso ($)</td><td>COP</td></tr>
<tr><td>Costa Rican Colón (₡)</td><td>CRC</td></tr>
<tr><td>Croatian Kuna (kn)</td><td>HRK</td></tr>
<tr><td>Cuban Peso ($)</td><td>CUP</td></tr>
<tr><td>Czech Koruna (Kč)</td><td>CZK</td></tr>
<tr><td>Danish Krone (kr)</td><td>DKK</td></tr>
<tr><td>Dominican Peso ($)</td><td>DOP</td></tr>
<tr><td>Egyptian Pound (£)</td><td>EGP</td></tr>
<tr><td>Euro (€)</td><td>EUR</td></tr>
<tr><td>Georgian Lari (₾)</td><td>GEL</td></tr>
<tr><td>Ghanaian Cedi (₵)</td><td>GHS</td></tr>
<tr><td>Guatemalan Quetzal (Q)</td><td>GTQ</td></tr>
<tr><td>Honduran Lempira (L)</td><td>HNL</td></tr>
<tr><td>Hong Kong Dollar ($)</td><td>HKD</td></tr>
<tr><td>Hungarian Forint (Ft)</td><td>HUF</td></tr>
<tr><td>Icelandic Króna (kr)</td><td>ISK</td></tr>
<tr><td>Indian Rupee (₹)</td><td>INR</td></tr>
<tr><td>Indonesian Rupiah (Rp)</td><td>IDR</td></tr>
<tr><td>Iranian Rial (﷼)</td><td>IRR</td></tr>
<tr><td>Iraqi Dinar (ع.د)</td><td>IQD</td></tr>
<tr><td>Israeli New Shekel (₪)</td><td>ILS</td></tr>
<tr><td>Jamaican Dollar ($)</td><td>JMD</td></tr>
<tr><td>Japanese Yen (¥)</td><td>JPY</td></tr>
<tr><td>Jordanian Dinar (د.ا)</td><td>JOD</td></tr>
<tr><td>Kazakhstani Tenge (₸)</td><td>KZT</td></tr>
<tr><td>Kenyan Shilling (Sh)</td><td>KES</td></tr>
<tr><td>Kuwaiti Dinar (د.ك)</td><td>KWD</td></tr>
<tr><td>Kyrgystani Som (с)</td><td>KGS</td></tr>
<tr><td>Lebanese Pound (ل.ل)</td><td>LBP</td></tr>
<tr><td>Macedonian Denar (ден)</td><td>MKD</td></tr>
<tr><td>Malaysian Ringgit (RM)</td><td>MYR</td></tr>
<tr><td>Mauritian Rupee (₨)</td><td>MUR</td></tr>
<tr><td>Mexican Peso ($)</td><td>MXN</td></tr>
<tr><td>Moldovan Leu (L)</td><td>MDL</td></tr>
<tr><td>Mongolian Tugrik (₮)</td><td>MNT</td></tr>
<tr><td>Moroccan Dirham (د.م.)</td><td>MAD</td></tr>
<tr><td>Myanma Kyat (Ks)</td><td>MMK</td></tr>
<tr><td>Namibian Dollar ($)</td><td>NAD</td></tr>
<tr><td>Nepalese Rupee (₨)</td><td>NPR</td></tr>
<tr><td>New Taiwan Dollar ($)</td><td>TWD</td></tr>
<tr><td>New Zealand Dollar ($)</td><td>NZD</td></tr>
<tr><td>Nicaraguan Córdoba (C$)</td><td>NIO</td></tr>
<tr><td>Nigerian Naira (₦)</td><td>NGN</td></tr>
<tr><td>Norwegian Krone (kr)</td><td>NOK</td></tr>
<tr><td>Omani Rial (ر.ع.)</td><td>OMR</td></tr>
<tr><td>Pakistani Rupee (₨)</td><td>PKR</td></tr>
<tr><td>Panamanian Balboa (B/.)</td><td>PAB</td></tr>
<tr><td>Peruvian Sol (S/.)</td><td>PEN</td></tr>
<tr><td>Philippine Peso (₱)</td><td>PHP</td></tr>
<tr><td>Polish Złoty (zł)</td><td>PLN</td></tr>
<tr><td>Pound Sterling (£)</td><td>GBP</td></tr>
<tr><td>Qatari Rial (ر.ق)</td><td>QAR</td></tr>
<tr><td>Romanian Leu (lei)</td><td>RON</td></tr>
<tr><td>Russian Ruble (₽)</td><td>RUB</td></tr>
<tr><td>Saudi Riyal (ر.س)</td><td>SAR</td></tr>
<tr><td>Serbian Dinar (дин.)</td><td>RSD</td></tr>
<tr><td>Singapore Dollar ($)</td><td>SGD</td></tr>
<tr><td>South African Rand (Rs)</td><td>ZAR</td></tr>
<tr><td>South Korean Won (₩)</td><td>KRW</td></tr>
<tr><td>South Sudanese Pound (£)</td><td>SSP</td></tr>
<tr><td>Sovereign Bolivar (Bs.)</td><td>VES</td></tr>
<tr><td>Sri Lankan Rupee (Rs)</td><td>LKR</td></tr>
<tr><td>Swedish Krona ( kr)</td><td>SEK</td></tr>
<tr><td>Swiss Franc (Fr)</td><td>CHF</td></tr>
<tr><td>Thai Baht (฿)</td><td>THB</td></tr>
<tr><td>Trinidad and Tobago Dollar ($)</td><td>TTD</td></tr>
<tr><td>Tunisian Dinar (د.ت)</td><td>TND</td></tr>
<tr><td>Turkish Lira (₺)</td><td>TRY</td></tr>
<tr><td>Ugandan Shilling (Sh)</td><td>UGX</td></tr>
<tr><td>Ukrainian Hryvnia (₴)</td><td>UAH</td></tr>
<tr><td>United Arab Emirates Dirham (د.إ)</td><td>AED</td></tr>
<tr><td>Uruguayan Peso ($)</td><td>UYU</td></tr>
<tr><td>Uzbekistan Som (so'm)</td><td>UZS</td></tr>
<tr><td>Vietnamese Dong (₫)</td><td>VND</td></tr>
</tbody>
</table>
