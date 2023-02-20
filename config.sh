$script = "default-lease-time 600;
max-lease-time 7200; 
authoritative;
subnet 192.168.20.0 netmask 255.255.255.0 { 
	range 192.168.20.100 192.168.20.200;
	option domain-name-servers 8.8.8.8;
	option domain-name 'server.com';
	option routers 192.168.20.254; 
	option broadcast-address 192.168.20.255; 
}"

apt-get update
apt-get install -y isc-dhcp-server
rm dhcpd.conf
sudo echo $script > /etc/dhcp/dhcpd.conf 
sudo systemctl restart isc-dhcp-server