# -*- mode: ruby -*-
# vi: set ft=ruby ;

$script = <<-SCRIPT
sudo apt-get update
sudo apt-get install -y isc-dhcp-server
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="eth1"/g' /etc/default/isc-dhcp-server
cd /etc/dhcp/
rm dhcpd.conf
echo "#!/bin/bash" >> dhcpd.conf
echo "default-lease-time 600;" >> dhcpd.conf
echo "max-lease-time 7200;" >> dhcpd.conf
echo "authoritative;" >> dhcpd.conf
echo "subnet 192.168.56.0 netmask 255.255.255.0 {" >> dhcpd.conf 
echo " range 192.168.56.100 192.168.56.200;" >> dhcpd.conf
echo "option: routers 192.168.56.1;" >> dhcpd.conf
echo "}" >> dhcpd.conf
sudo systemctl restart isc-dhcp-server.service
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define "dhcp" do |server|
   server.vm.box = "generic/ubuntu1804"
   server.vm.hostname = "dhcp-server"
   server.vm.network  "private_network", ip: "192.168.56.2"
   server.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "dhcp-server"]
   end
   server.vm.provision "shell", privileged:true, inline: $script
  end

   (1..2).each do |i|
    config.vm.define "web-#{i}" do |web|
     web.vm.box = "generic/ubuntu1804"
     web.vm.hostname = "web"
     web.vm.network "private_network", ip: "192.168.56.1#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "shell", privileged:true, path: "dhcp_client.sh"
    end
   end
end
