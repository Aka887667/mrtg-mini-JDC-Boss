#!/bin/sh
# this generate two lines
top -bn2 | grep "Cpu(s)" | awk -F'id,' '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s\n", 100 - v }'
echo 0
echo 0
