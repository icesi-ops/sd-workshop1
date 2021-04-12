# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.


Vagrant.configure("2") do |config|

  #En esta primera parte se cre la web a la que se hará scraping

  config.vm.define :web_icesi do |web|
   web.vm.box = "centos/7"
   web.vm.network "private_network", ip: "192.168.33.11"
   web.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web"]
   end
  
   web.vm.provision "file", source: "sources/", destination: "src"
    #En estes script se hace la configuración del scraping (serverconf)
   web.vm.provision "shell", path:"sources/serverconf.sh"
   #En este se impriemn las variables solicitadas. 
  web.vm.provision "shell", path: "sources/script.sh"
  end

  #En est sección se asigna ip dinámica. 

  config.vm.define "web_dhcp" do |web_dhcp|
    web_dhcp.vm.box = "centos/7"
    web_dhcp.vm.network "private_network", type: "dhcp"
    web_dhcp.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web_dhcp"]
    end
   web_dhcp.vm.provision "shell", inline: "echo $HOSTNAME"
   web_dhcp.vm.provision "shell", path:"sources/dhcp.sh"

  end

end