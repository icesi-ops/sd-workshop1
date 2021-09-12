#!/bin/bash

sudo su
sudo yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
curl https://www.icesi.edu.co/es/ > /var/www/html/index.html 

var=$(hostname)
var1=$(hostname -i)
var2=$(date +%s)
var3=$(df -k)
var4=$(pgrep -u root --list-name)
var5=$(ps aux | sort -nrk 3,3 | head -n 1)
echo -NombreHost: $var -IP: $var1

echo -Timestamp: $var2 -DiskFreeSpace: $var3 
echo -ProcessRunning: $var4 
echo -MostConsummedProcess: $var5
