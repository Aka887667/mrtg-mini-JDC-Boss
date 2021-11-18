#!/bin/sh
# this generate two lines
top -bn2 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}';
echo 0
echo 0
