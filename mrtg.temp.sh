#!/bin/sh
# if there is an error while loading shared libraries: libvcos.so
# fix it with https://github.com/Hexxeh/rpi-update/issues/143

# inside temperature
# there is an utility tool for that
tm=`/opt/vc/bin/vcgencmd measure_temp`
# tc=`echo $tm| cut -d '=' -f2 | sed 's/..$//'`
# but the simpler way is to read it directly from system
tc=`awk '{printf("%.1f\n",$1/1e3)}' /sys/class/thermal/thermal_zone0/temp`

# outside temperature
# this can be fetched from openweathermap, but to do that you need to subscribe
# (it is free) and specify where you want to get the data
# curl -v --silent 'http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&mode=json&units=metric&appid=12345' --stderr - > /tmp/weather.json
# grep -Po '"temp":.*?[^\\],' /tmp/weather.json | cut -d':' -f2 > /tmp/temperature.txt

# remove last comma
# to=`cat /tmp/temperature.txt`
# to=${to%?};
to=0

echo $tc
echo $tc
echo $tc
echo 0
echo 'temperature'
