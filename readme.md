

头爷我来了，宝。

先用mrtg把树莓派监控起来，继承下老外的衣钵。然后再用mrtg把京东云无线宝的监工做起来。

一、关于京东云无线宝监工的思考

1、首先我反对公有云模式的监工，毕竟大家要把key给到第三方，不安全。

2、其次个人觉得私有云模式的监工，大家还是有点需求的，我有个5台无线宝，也想看看每天的收入和流量的关系，有没很好的压榨运营商带宽，是否可以再挂一次无线宝？反正就是想获得更高的投资回报；也想看看负载怎么样，有没什么问题等等。

监工目标如下：

1、跑在树莓派里，最小消耗资源。运行环境 PI 4,Debian 10 buster

2、简单，贼简单。

二、安装操作步骤

三、Changelog

2021-10-10

1、考虑到节省资源，我用的micro-httpd，web目录在/var/www/html/，所以我把mtrg相关的workdir都改到/var/www/html/mrtg了。

2、我只想监控CPU内存网络和温度，硬盘空间监控没什么必要，删了。温度是不是有必要，也可以适度纠结一下。

3、最大内存改为了3930860

4、修复网络流量统计的BUG，看后面能否用eth*代替eth0，这样也可以统计eth1的流量了。

四、TODO

1、温度那里有个什么weather，去掉？



Thanks for gasp's work.I've fixed it for Raspberry PI 4+ and Debian 10 buster.

# mrtg-rpi-min
a minimal dependence-free mrtg installation for raspberry pi

supported platforms: raspberry pi model A, B and Zero running Raspbian Jessie and Stretch
(other platforms are untested)
