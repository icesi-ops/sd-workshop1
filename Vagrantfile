Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

config.vm.define "server" do |server|
	server.vm.hostname = "dhcpserver"
    server.vm.box ="generic/ubuntu1804"
    server.vm.network "private_network", ip: "192.168.20.254"
	server.vm.provision "shell", path: "config.sh" 
  end

  config.vm.define "client" do |client|
    client.vm.box ="generic/ubuntu1804"
    client.vm.network "private_network", type: "dhcp"
    client.vm.provision "shell", path: "configclient.sh"
  end
end