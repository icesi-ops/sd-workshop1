# -*- mode: ruby -*-
# vi: set ft=ruby ;
Vagrant.configure("2") do |config|
  config.vm.define "server" do |server|
    server.vm.box ="generic/centos9s"
    server.vm.network "private_network", ip: "192.168.100.2",
     virtualbox__intnet: "red-interna"
    server.vm.provision "shell", privileged:true, path: "server.sh"
  end
  (1..2).each do |i|
   config.vm.define "client-#{i}" do |client|
     client.vm.box = "centos/7"
     client.vm.hostname = "client-#{i}"
     client.vm.network "private_network", type: "dhcp",
       virtualbox__intnet: "red-interna"
     client.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "client-#{i}"]
     end
    end
  end
end
