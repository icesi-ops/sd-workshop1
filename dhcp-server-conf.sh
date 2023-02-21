#!/bin/bash

# Instalar el servidor DHCP
sudo apt-get update
sudo apt-get install -y isc-dhcp-server

# Configurar la red interna
sudo tee -a /etc/dhcp/dhcpd.conf << EOF
subnet 192.168.69.0 netmask 255.255.255.0 {
  range 192.168.69.100 192.168.69.200;
  option routers 192.168.69.10;
}
EOF

# Configurar la interfaz de red del servidor
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="eth1"/g' /etc/default/isc-dhcp-server

# Reiniciar el servicio
sudo systemctl restart isc-dhcp-server
