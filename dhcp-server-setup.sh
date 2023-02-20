#!/usr/bin/env bash

apt-get update
apt-get install -y isc-dhcp-server

cat << EOF > /etc/dhcp/dhcpd.conf
subnet 192.168.56.0 netmask 255.255.255.0{
	range 192.168.56.20 192.168.56.50;
	option routers 192.168.56.1;
	option domain-name-servers 8.8.8.8, 8.8.4.4;
}
EOF

systemctl start isc-dhcp-server
