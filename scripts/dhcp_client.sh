#!/bin/bash

# Stop any existing DHCP client
cd /etc/netplan
sudo rm 50-vagrant.yaml
sudo dhclient -r -v "eth1" 2> /dev/null

# Request new IP address from DHCP server
sudo dhclient "eth1"
