Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

config.vm.define "server" do |server|
	  server.vm.hostname = "dhcp_server"
    server.vm.box ="generic/centos9s"
    server.vm.network "private_network", ip: "192.168.20.254",
     virtualbox__intnet: "red-interna"
	  server.vm.provision "shell", inline: <<-SHELL
	    sudo apt-get update
	    sudo apt-get install -y isc-dhcp-server
	    sudo cat > /etc/dhcp/dhcpd.conf << EOF
	    subnet 192.168.20.0 netmask 255.255.255.0 {
	      range 192.168.20.100 192.168.130.200;
	      option routers 192.168.20.1;
				option broadcast-address 192.168.20.255;
	      option domain-name-servers 8.8.8.8, 8.8.4.4;
	    }
	    EOF
	    sudo systemctl restart isc-dhcp-server
	  SHELL
  end

  config.vm.define "client" do |cliente|
    cliente.vm.box ="generic/centos9s"
    cliente.vm.network "private_network", type: "dhcp",
     virtualbox__intnet: "red-interna"
  end
end