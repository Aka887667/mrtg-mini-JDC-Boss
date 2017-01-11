#!/bin/bash



###
###     Partition space - outputs four lines for mrtg graphs
###
###     1: used bytes on partition
###     2: total available bytes on partition
###     3: uptime
###     4: hostname
###

partition=$1

###     No partition asked ?? just echo zero's and exit
if [ -z "$partition" ]; then
        echo "0"
        echo "0"
        uptime
        hostname
        exit
fi

###     Get info from "df" command
line=`df | grep "^$partition " `
used=`echo $line | awk '{ print $3 }' `
available=`echo $line | awk '{ print $4 }' `
total=`echo $line | awk '{ print $2 }' `

#dusage=`du -s /home/ | awk '{ print $1 }' `
#echo "scale=4;100-(($dusage/$total)*101)" | bc


echo 0;
#echo "scale=4;(($dusage/$total)*101)" | bc
echo "scale=4;(($used/$total)*101)" | bc
#echo "scale=4;($used/$total)*100" | bc
#echo "scale=4;100-(($down/$total)*101)" | bc


###	Get info from "du" command
#du = `du -s /home/ | grep "^$partition " `
#bytes = `echo $du | awk'{ print $1 }'`
#echo $bytes;

###     Return four lines of output
#echo $line | awk '{ print $3 }'
#echo $line | awk '{ print $2 }'
#echo $line | awk '{ print $4 }'
#echo $line | awk '{ print $4 }'| "*5" | bc
#echo $line | awk '{ print $5 }'
uptime
hostname
