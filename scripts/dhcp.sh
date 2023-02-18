#!/bin/bash

# Install DHCP server package
sudo apt-get update
sudo apt-get install -y isc-dhcp-server

# Configure DHCP server
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="eth1"/g' /etc/default/isc-dhcp-server
sudo cat > /etc/dhcp/dhcpd.conf <<EOF
# DHCP Server Configuration file
# see /usr/share/doc/dhcp-server/dhcpd.conf.example
# This file was created by the script

# option definitions common to all supported networks
option domain-name "example.com";
option domain-name-servers ns1.example.com, ns2.example.com;

default-lease-time 600;
max-lease-time 7200;

# Use this to enble/disable dynamic dns updates globally.
#ddns-update-style none;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# Define network
subnet 192.168.33.0 netmask 255.255.255.0 {
  range 192.168.33.100 192.168.33.200;
  option routers 192.168.33.1;
}
EOF

# Restart DHCP server
sudo systemctl restart isc-dhcp-server.service