
# Exercise 1 - Initialize your weather report log file
### 1.1 Create a text file called `rx_poc.log`

```bash
touch rx_poc.log
```

<br/>

### 1.2 Add a header to your weather report.

```bash
echo 'year\tmonth\tday\thour\tobs_tmp\tfc_temp' > rx_poc.log
```


<br/>
<br/>
# Exercise 2 - Write a bash script that downloads the raw weather data, and extracts and loads the required data

### 2.1. Create a text file called `rx_poc.sh` and make it a bash script

```bash
touch rx_poc.sh
echo '#! /bin/bash' > rx_poc.sh
chmod +x rx_poc.sh
```

<br/>

### 2.2 Download today’s weather report from wttr.in
I will use `open-meto` as an alternative for `wttr.in` because it's not working for some reason, it gets connection time out.

<br/>

##### 2.2.1 Create the filename for today’s wttr.in weather report

```bash
weather_report=raw_data_$(date +%Y%m%d)
touch weather_report
```

<br/>
##### 2.2.2 Download the wttr.in weather report for Casablanca and save it with the filename you created

```bash
api="https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m"
curl $api > $weather_report
echo $'\n' >> $weather_report
```


```bash
cat raw_data_20240823

{"latitude":52.52,"longitude":13.419998,"generationtime_ms":0.03707408905029297,"utc_offset_seconds":0,"timezone":"GMT","timezone_abbreviation":"GMT","elevation":38.0,"current_units":{"time":"iso8601","interval":"seconds","temperature_2m":"°C","wind_speed_10m":"km/h"},"current":{"time":"2024-08-23T08:30","interval":900,"temperature_2m":21.9,"wind_speed_10m":14.3}}
```

<br/>
##### 2.3.1. Extract the current temperature, and store it in a shell variable called `obs_tmp`

```bash
obs_tmp=$(head -1 raw_data_20240823 | rev | cut -d "," -f 2 | rev | cut -d ":" -f 2)
fc_tmp=$(head -1 raw_data_20240823 | rev | cut -d "," -f 2 | rev | cut -d ":" -f 2)
```

<br/>
<br/>
### 2.4. Store the current hour, day, month, and year in corresponding shell variables

```bash
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)
```

<br/>
<br/>

### 2.5. Merge the fields into a tab-delimited record, corresponding to a single row in **Table 1**.

```bash
record=("$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_tmp")
echo $record >> rx_poc.log
```

```bash
cat rx_poc.log

year\tmonth\tday\thour\tobs_tmp\tfc_temp
2024\t08\t23\t09\t23.7\t23.7
```

<br/>
<br/>
<br/>

# Exercise 3 - Schedule your bash script `rx_poc.sh` to run every day at noon local time

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

0 0 * * * /home/Documents/Projects/ibm-data-eng/Historical-Weather-Forecast-Comparison-to-Actuals/rx_poc.sh
```

in order for the job to work i had to add the full path in the bash script.

<br/>
<br/>
<br/>

# Full solution
```bash
#! /bin/bash

loc="/home/dev/Documents/Projects/ibm-data-eng/Historical-Weather-Forecast-Comparison-to-Actuals"

# create a datestamped filename for the raw wttr data:
weather_report=raw_data_$(date +%Y%m%d)
touch "$loc/$weather_report"
weather_report="$loc/$weather_report"


# download today's weather report from open-meto:
api="https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m"
curl $api > $weather_report
echo $'\n' >> $weather_report


# extract the current temperature 
obs_tmp=$(head -1 raw_data_20240823 | rev | cut -d "," -f 2 | rev | cut -d ":" -f 2)
fc_tmp=$(head -1 raw_data_20240823 | rev | cut -d "," -f 2 | rev | cut -d ":" -f 2)


# use command substitution to store the current day, month, and year in corresponding shell variables:
hour=$(TZ='Morocco/Casablanca' date -u +%H)
day=$(TZ='Morocco/Casablanca' date -u +%d)
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)


# create a tab-delimited record
# recall the header was created as follows:
# header=$(echo -e "year\tmonth\tday\thour_UTC\tobs_tmp\tfc_temp")
# echo $header>rx_poc.log

record=("$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_tmp")

# append the record to rx_poc.log
echo $record >> "$loc/rx_poc.log"
```
