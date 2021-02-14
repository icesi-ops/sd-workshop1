#!/bin/bash
sudo yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
curl https://www.icesi.edu.co/es/ >> /var/www/html/index.html
free -m | awk 'NR==2{print $4}'
echo "Terminando proceso de creacion de webpage"
echo "La fecha (timestamp):" "$(date +%s)"
echo El Hostname es: "$(hostname)"
echo "Total free RAM in MB: `free -m | awk 'NR==2{print $4}'`"
echo "IP para acceder: `ip -f inet addr show eth1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'`"


