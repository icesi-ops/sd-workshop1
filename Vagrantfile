Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo ai"

  config.vm.define "dhcpserver" do |dhcp|
    dhcp.vm.box = "generic/ubuntu1804"
    dhcp.vm.hostname = "dhcp-server"
    dhcp.vm.network "private_network", ip:"192.168.69.10", :dev => "eth1"
    dhcp.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "dhcp-server"]
    end
    dhcp.vm.provision "shell", path: "dhcp-server-conf.sh"
  end

  (1..2).each do |i|
   config.vm.define "client-#{i}" do |client|
     client.vm.box = "generic/ubuntu1804"
     client.vm.hostname = "client-#{i}"
     client.vm.network "private_network", type:"dhcp"
     client.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "client-#{i}"]
     end
   end
  end
  
end
