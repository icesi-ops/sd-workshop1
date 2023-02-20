# sd-workshop1 2021-B
- make that IP assignament dynamically  
- Use config.vm.provision "file" to transfer a file from your host machine to your guest machine. THis file is a bash script that print HOSTNAME+IP+Timestamp server+DIsk space avaialable+proccess running+the most consuming process.  
- use config.vm.provision "shell" to execute the file that you transfered  

## Bonus
Servidor web que sea scraping de cualquier página web

PR a sd-workshop1
<br>
<br>
# Entrega Juan Fernando Angulo
El provisionamiento funciona de la siguien manera:
1. Primero se crea una maquina que actua actuará como servidor DHCP, para esto se instala isc-dhcp-server, se configura modificando los archivos /etc/default/isc-dhcp-server y /etc/dhcp/dhcpd.conf y luego se reinicia para que se active con nuestra configuración. Todo esto a través de una inline shell en el Vagranfile.
    ```bash
    SHELL
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
    ```
2. Después de crean las maquinas clientes a las que se les asigna un dirección ip estática dentro de la misma subred que el servidor DHCP para que apenas se incien estas le pidan una nueva dirección usando el comando dhclient y luego elimina su dirección ip estática signada inicialmente. Esto también se logra a través de una inline shell.
    ```bash
    SHELL
        # Le pedimos una dirección IP al servidor DHCP que está en 192.168.56.10
        sudo dhclient -s 192.168.56.10 -v eth1
        # Eliminamos la dirección IP estática que habíamos asignado inicialmente
        sudo ip addr del 192.168.56.11/24 dev eth1
        # Mostramos por consola la nueva dirección IP que nos dio el servidor DHCP
        echo -n ">> La dirección IP asignada es: " && ip addr show eth1 | grep inet | grep -v inet6 | grep -oP 'inet .*? brd' | tr -d 'inet brd'
    SHELL
    ```
## Evidencias
A continuación se adjuntan evidencias del funcionamiento durante la creación y provisionamiento de las maquinas con el comando vagrant up:
- Servidor DHCP activo
![Servidor dhcp activo](./screenshots/dhcp-server_active.png?raw=true "Servidor DHCP")
- Asignación dinámica de IP máquinas clientes  
Nodo 1:
![Servidor dhcp activo](./screenshots/assigned-ip_node1.png?raw=true "Nodo 1")
Nodo 2:
![Servidor dhcp activo](./screenshots/assigned-ip_node2.png?raw=true "Nodo 2")