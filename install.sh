#!/bin/bash

# this script does very simple things
# reading it before executing it
# is a good idea

# install those config files
mkdir -p /etc/mrtg
mkdir -p /var/log/mrtg/
cp ./*.cfg /etc/mrtg/
cp ./*.sh /etc/mrtg/
env LANG=C mrtg /etc/mrtg/cpu.cfg
env LANG=C mrtg /etc/mrtg/cpu-mem-traffic.cfg --logging /var/log/mrtg/mrtg.log

env LANG=C /usr/bin/mrtg


# generate index in destination folder
mkdir -p /var/www/html/mrtg

env LANG=C /usr/bin/indexmaker --output=/var/www/html/mrtg/index.html \
--title="pi usage" \
--sort=name \
--enumerate \
/etc/mrtg/mrtg.cfg \
/etc/mrtg/cpu.cfg \
/etc/mrtg/mem.cfg \
/etc/mrtg/traffic.cfg \
/etc/mrtg/temp.cfg

# add to cron
# using this technique: https://stackoverflow.com/questions/878600/

crontab -l > mycron.tmp

if grep -q mrtg mycron.tmp; then
  echo 'There is already a mrtg action in the crontab';
  exit 1
fi

# every minutes, check cpu, memory and traffic
echo "* * * * * env LANG=C mrtg /etc/mrtg/cpu-mem-traffic.cfg --logging /var/log/mrtg/mrtg.log >/dev/null 2>&1" >> mycron.tmp
echo "* * * * * env LANG=C mrtg /etc/mrtg/temp.cfg --logging /var/log/mrtg/mrtg.log >/dev/null 2>&1" >> mycron.tmp

# install the new updated cron file
crontab mycron.tmp
rm mycron.tmp
