# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "dhcp-server" do |server|
    server.vm.box = "ubuntu/focal64"
    server.vm.network "private_network", ip: "192.168.56.10"
    server.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y isc-dhcp-server
      sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="enp0s8"/' /etc/default/isc-dhcp-server
      # Configurar el servidor DHCP
      echo 'default-lease-time 600;' >> /etc/dhcp/dhcpd.conf
      echo 'max-lease-time 7200;' >> /etc/dhcp/dhcpd.conf
      echo 'subnet 192.168.56.0 netmask 255.255.255.0 {' >> /etc/dhcp/dhcpd.conf
      echo '  range 192.168.56.100 192.168.56.200;' >> /etc/dhcp/dhcpd.conf
      echo '  option routers 192.168.56.10;' >> /etc/dhcp/dhcpd.conf
      echo '  option domain-name-servers 8.8.8.8, 8.8.4.4;' >> /etc/dhcp/dhcpd.conf
      echo '}' >> /etc/dhcp/dhcpd.conf
      sudo systemctl restart isc-dhcp-server
      sleep 5
      sudo systemctl status isc-dhcp-server
    SHELL
    server.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "dhcp-srv"]
    end
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "centos/7"
    node1.vm.hostname = "node-1"
    node1.vm.network "private_network", ip: "192.168.56.11"
    node1.vm.provision "shell", inline: <<-SHELL
      sudo dhclient -r eth1
      sudo dhclient -s 192.168.56.10 -v eth1
      sudo ip addr del 192.168.56.11/24 dev eth1
      ip addr show eth1 | grep inet | grep -v "inet6"
    SHELL
    node1.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "node-1"]
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "centos/7"
    node2.vm.hostname = "node-2"
    node2.vm.network "private_network", ip: "192.168.56.12"
    node2.vm.provision "shell", inline: <<-SHELL
      sudo dhclient -r eth1
      sudo dhclient -s 192.168.56.10 -v eth1
      sudo ip addr del 192.168.56.12/24 dev eth1
      ip addr show eth1 | grep inet | grep -v "inet6"
    SHELL
    node2.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "node-2"]
    end
  end

end