#!/bin/sh
netstat -i | grep -E 'eth0|wlan0' | awk '{print $3}' # RX
#netstat -i | grep -E 'eth0|wlan0' | awk '{print $4}' # RX
#netstat -i | grep -E 'eth0|wlan0' | awk '{print $7}' # TX
netstat -i | grep -E 'eth0|wlan0' | awk '{print $8}' # TX
echo 0
echo 0
