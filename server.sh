#!/bin/bash
dnf install -y dhcp-server
cd /etc/dhcp
echo "authoritative;" >> dhcpd.conf
echo "log-facility local7;" >> dhcpd.conf
echo "subnet 192.168.100.0 netmask 255.255.255.0 {" >> dhcpd.conf
echo " range 192.168.100.100 192.168.100.200;" >> dhcpd.conf
echo " option routers 192.168.100.1;" >> dhcpd.conf
echo " option broadcast-address 192.168.100.255;" >> dhcpd.conf
echo " default-lease-time 600;" >> dhcpd.conf
echo " max-lease-time 7200;" >> dhcpd.conf
echo "}" >> dhcpd.conf
systemctl start dhcpd.service
