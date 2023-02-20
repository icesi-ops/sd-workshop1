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
      # Configuración del servidor DHCP
      echo 'default-lease-time 600;' >> /etc/dhcp/dhcpd.conf
      echo 'max-lease-time 7200;' >> /etc/dhcp/dhcpd.conf
      echo 'subnet 192.168.56.0 netmask 255.255.255.0 {' >> /etc/dhcp/dhcpd.conf
      echo '  range 192.168.56.100 192.168.56.200;' >> /etc/dhcp/dhcpd.conf
      echo '  option routers 192.168.56.10;' >> /etc/dhcp/dhcpd.conf
      echo '  option domain-name-servers 8.8.8.8, 8.8.4.4;' >> /etc/dhcp/dhcpd.conf
      echo '}' >> /etc/dhcp/dhcpd.conf
      sudo systemctl restart isc-dhcp-server
      sleep 5
      # Verificamos que el servidor DHCP este activo y corriendo
      sudo systemctl status isc-dhcp-server
    SHELL
    server.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "dhcp-srv"]
    end
  end

  (1..2).each do |i|
    config.vm.define "node#{i}" do |client|
      client.vm.box = "centos/7"
      client.vm.network "private_network", ip: "192.168.56.11"
      client.vm.provision "shell", inline: <<-SHELL
        # Le pedimos una dirección IP al servidor DHCP que está en 192.168.56.10
        sudo dhclient -s 192.168.56.10 -v eth1
        # Eliminamos la dirección IP estática que habíamos asignado inicialmente
        sudo ip addr del 192.168.56.11/24 dev eth1
        # Mostramos por consola la nueva dirección IP que nos dio el servidor DHCP
        echo -n ">> La dirección IP asignada es: " && ip addr show eth1 | grep inet | grep -v inet6 | grep -oP 'inet .*? brd' | tr -d 'inet brd'
      SHELL
      client.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "node-#{i}"]
      end
    end
  end

end