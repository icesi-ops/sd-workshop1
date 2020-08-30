# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

(1..2).each do |i|
  config.vm.define "Maquina-#{i}" do |server|
   server.vm.box = "centos/7"
   server.vm.network "private_network", type: "dhcp"
server.vm.hostname = "Maquina-#{i}"
   server.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "Maquina-{i}"]  
   end
server.vm.provision "file", source: "./provision.sh", destination: "provision.sh"
server.vm.provision "shell", inline: "./provision.sh"
  end
end
end
