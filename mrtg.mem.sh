#!/bin/sh
#mem used by apps and services = used - buffes - caches
free -k | grep Mem | awk '{print ($3-$6-$7)}'
# swap
free -k | grep Swap | awk '{print $3}'
echo 0
echo 'ram and swap'
