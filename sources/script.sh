#!/bin/bash

var=$(hostname)
var1=$(hostname -I)
var2=$(date +%s)
var3=$(df -h)
var4=$(ps aux --width 30 --sort -rss | head -n 2)

echo +++++++++++++++++ **Script Start** ++++++++++++++++
echo *HostName*: $var 
echo *IP* NAT and Host Only: $var1
echo *Timestamp*: $var2
echo *Free Disk Space*: $var3
echo Most consuming process:  $var4 
echo +++++++++++++++++ **Script End** ++++++++++++++++++
