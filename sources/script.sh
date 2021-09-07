#!/bin/bash

sudo su
sudo yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
curl https://www.icesi.edu.co/es/ > /var/www/html/index.html 

var=$(hostname)
var1=$(hostname -i)
var2=$(date +%s)
var4=$(free -b)
echo -NombreHost: $var -IP: $var1
echo -Timestamp: $var2 -RAM: $var4
