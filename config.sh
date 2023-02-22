$script = "default-lease-time 600;
max-lease-time 7200; 
authoritative;
subnet 192.168.56.0 netmask 255.255.255.0 { 
	range 192.168.56.100 192.168.56.200;
	option domain-name-servers 8.8.8.8;
	option domain-name 'server.com';
	option routers 192.168.56.254; 
	option broadcast-address 192.168.56.255; 
}"

apt-get update
apt-get install -y isc-dhcp-server
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="eth1"/g' /etc/default/isc-dhcp-server
cd /etc/dhcp/
rm dhcpd.conf 
sudo sh -c 'echo "$script" | tee /etc/dhcp/dhcpd.conf'
sudo systemctl restart isc-dhcp-server
