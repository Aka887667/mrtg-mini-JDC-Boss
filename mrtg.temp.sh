#!/bin/sh

# inside temperature
tzero=`awk '{printf("%.1f\n",$1/1e3)}' /sys/class/thermal/thermal_zone0/temp`
tone=`awk '{printf("%.1f\n",$1/1e3)}' /sys/class/thermal/thermal_zone1/temp`

# outside temperature
# if there is only one capter
# curl -v --silent 'http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&mode=json&units=metric&appid=3fa08af9ea5be0c0d004e0c648591e5e' --stderr - > /tmp/weather.json
# grep -Po '"temp":.*?[^\\],' /tmp/weather.json | cut -d':' -f2 > /tmp/temperature.txt
# remove last comma
# to=`cat /tmp/temperature.txt`
# to=${to%?};

echo $zero
echo $tone
echo 0
echo 'temperature'
