#!/bin/bash

# this script does very simple things
# reading it before executing it
# is a good idea

# make sure that it is running as root
if [[ $EUID -ne 0 ]]; then
   echo 'This script must be run as root';
   exit 1
fi

# make sure that mrtg has been installed
if [[ ! -f /usr/bin/mrtg ]] ; then
    echo 'mrtg binary "/usr/bin/mrtg" does not exist, aborting.';
    echo 'please make sure that you have correctly installed mrtg by typing';
    echo 'apt-get install mrtg';
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install those config files
mkdir -p /etc/mrtg
mkdir -p /var/log/mrtg/
cp $DIR/cpu.cfg /etc/mrtg/
cp $DIR/mrtg.cpu.sh /etc/mrtg/
env LANG=C mrtg /etc/mrtg/cpu.cfg
#  env LANG=C mrtg /etc/mrtg/cpu-mem-traffic.cfg --logging /var/log/mrtg/mrtg.log

env LANG=C /usr/bin/mrtg


# generate index in destination folder
mkdir -p /var/mrtg

env LANG=C /usr/bin/indexmaker --output=/var/mrtg/index.html \
--title="pi usage" \
--sort=name \
--enumerate \
/etc/mrtg/mrtg.cfg \
/etc/mrtg/cpu.cfg \
/etc/mrtg/mem.cfg \
/etc/mrtg/traffic.cfg \
/etc/mrtg/disk.cfg \
/etc/mrtg/temp.cfg

# add to cron
# using this technique: https://stackoverflow.com/questions/878600/

crontab -l > mycron.tmp

if grep -q mrtg mycron.tmp; then
  echo 'There is already a mrtg action in the crontab';
  exit 1
fi

# every 5 minutes, check cpu, memory and traffic
echo "*/5 * * * * env LANG=C mrtg /etc/mrtg/cpu-mem-traffic.cfg --logging /var/log/mrtg/mrtg.log >/dev/null 2>&1" >> mycron.tmp
# every half an hour, check disk
echo "*/30 * * * * env LANG=C mrtg /etc/mrtg/disk.cfg --logging /var/log/mrtg/mrtg.log >/dev/null 2>&1" >> mycron.tmp
# every hour, check temperature
echo "1 * * * * env LANG=C mrtg /etc/mrtg/temp.cfg --logging /var/log/mrtg/mrtg.log >/dev/null 2>&1" >> mycron.tmp
# install the new updated cron file
crontab mycron.tmp
rm mycron.tmp
