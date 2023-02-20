sudo rm /etc/netplan/50-vagrant.yaml
sudo dhclient -r -v "eth1"
sudo dhclient "eth1"