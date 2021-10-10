
Thanks for gasp's work.I've fixed it for Raspberry PI 4+ and Debian 10 buster.
把这个脚本移植到RPI 4B里

一、Changelog

2021-10-10

1、考虑到节省资源，我用的micro-httpd，web目录在/var/www/html/，所以我把mtrg相关的workdir都改到/var/www/html/mrtg了。

2、我只想监控CPU内存网络和温度，硬盘空间监控没什么必要，删了。温度是不是有必要，也可以适度纠结一下。

3、最大内存改为了3930860。通过cat /proc/meminfo | grep MemTotal 获得，64位的OS应该会大一些。

4、修复网络流量统计的BUG，看后面能否用eth*代替eth0，这样也可以统计eth1的流量了。

二、TODO

1、温度那里有个什么weather，去掉？
2、要支持4个CPU的，目前是2个。


# mrtg-rpi-min
a minimal dependence-free mrtg installation for raspberry pi

supported platforms: raspberry pi model A, B and Zero running Raspbian Jessie and Stretch
(other platforms are untested)
