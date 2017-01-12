#!/bin/sh
netstat -i | grep -e eth0 | awk '{print $4}' # RX
netstat -i | grep -e eth0 | awk '{print $8}' # TX
echo 0
echo 0

