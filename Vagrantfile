# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :centos_server do |server|
    server.vm.box = "centos/7"
    server.vm.network "private_network", type: "dhcp"
    server.vm.provision "shell", inline: "/usr/bin/bash /home/vagrant/file.sh"
    server.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "centos-srv"]
    end
  end
  config.vm.provision "file", source: "/home/ernesto/Documentos/Sis_Dis/Repos/workshop1/file.sh" , destination: "~/file.sh"
end
