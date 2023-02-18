#!/bin/bash

# Stop any existing DHCP client
sudo dhclient -r

# Request new IP address from DHCP server
sudo dhclient -d -s "192.168.33.10" -v "eth1"