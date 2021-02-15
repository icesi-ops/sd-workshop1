#!/bin/bash

sudo yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
curl https://www.icesi.edu.co/es/ > /var/www/html/index.html 

ip=$(hostname -I)
hostname=$(cat /etc/hostname)
time=$(date '+%s')
memory=$(free -m | awk 'NR==3{print $4}')

echo "HOSTNAME -> "$hostname", ip -> "$ip", time -> "$time",memory-> "$memory" "
