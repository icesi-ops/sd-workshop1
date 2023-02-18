# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "dhcp-srv" do |dhcp_server|
      dhcp_server.vm.box = "generic/ubuntu1804"
      dhcp_server.vm.network "private_network", ip: "192.168.33.10"
      dhcp_server.vm.hostname = "dhcp-srv"
      dhcp_server.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "dhcp"]
       end
      dhcp_server.vm.provision "shell", path: "scripts/dhcp.sh"
    end
    
    (1..1).each do |i|
      config.vm.define "dhcp-cli" do |client|
        client.vm.box = "generic/ubuntu1804"
        client.vm.network "private_network", ip: "192.168.33.2#{i}"
        client.vm.hostname = "dhcp-cli#{i}"
        client.vm.provider "virtualbox" do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "client"]
         end
        client.vm.provision "shell", path: "scripts/client.sh"
      end
    end
  end