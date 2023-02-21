# Workshop-1
Servidor DHCP que permita a otros servidores nodo obtener una dirección IP dinámica sin utilizar "type: "dhcp", en la configuración de red de las máquinas nodo.

## Explicación


### dhcp-server

Para la solución se tendrán en cuenta 3 máquinas virtuales en el Vagrantfile. La primera será el servidor que definiremos como "dhcp-server". Este servidor lo provisionaremos por medio de "shell" de la siguiente forma

![Provisionamiento servidor DHCP](https://github.com/dannasofiagarcia/sd-workshop1/blob/master/img/provisionamiento-dhcp-server)

En la que al principio instalamos isc-dhcp-server y a continuación realizamos todas las configuraciones tales como subnet, rangos de IP que asignará el servidor, y demás que irán en el dhcpd.conf

### nodes

Las otras dos máquinas virtuales serán "node1" y "node2" las cuales serán las que se conecten al servidor. Estas dos tienen las mismas configuraciones, por lo que se podrían crear mediante un for igualmente. El provisionamiento de los nodos es el siguiente

![Provisionamiento servidor DHCP](https://github.com/dannasofiagarcia/sd-workshop1/blob/master/img/provisionamiento-node)

"node1" y "node2" estarán en la misma red privada que el dhcp-server para que de esta forma puedan pedirle mediante el comando "sudo dhclient -s ip-dhcp-server -v interfaz-red". La interfaz a la que el dhcp-server le asigné la dirección quedará con dos direcciones IP, por lo que mediante el comando "sudo ip addr del ip-node-1 dev eth1" eliminaremos la dirección IP que no fue asignada por el servidor.

## Evidencia funcionamiento

Podemos ver que el node 1 y el node 2 hacen el request para la dirección IP de eth1 por medio de DHCPREQUEST, mediante DHCPOFFER recibe la oferta y obtiene la dirección IP. Podemos evidenciar con la última linea que la dirección IP fue asignada correctamente.

### Node 1
![Provisionamiento servidor DHCP](https://github.com/dannasofiagarcia/sd-workshop1/blob/master/img/node1-funcionamiento)

### Node 2
![Provisionamiento servidor DHCP](https://github.com/dannasofiagarcia/sd-workshop1/blob/master/img/node2-funcionamientos)



      
