# sd-workshop1

### En este workshop se pedía realizar lo siguiente: 

1. Scraping ICESI
2. Hostname, Dirección IP, Date y Memoria Ram Libre

####Bonus
3. Direcciones IP dinámicas


##### Para la resolución del punto 1 se procedió de la siguiente manera: 

Se instaló el wget para conseguir el index.html de la página web de ICESI

`sudo yum  install -y wget`

Posteriormente, se realizó la instalación del httpd, para colocar como servidor la máquina virtual

`sudo yum install -y httpd`

Luego, se debía acceder al directorio /var/www/html en donde se realiza el scraping de la página web de ICESI

##### Punto 2

En el punto 2 se pedía imprimir el hostname de la máquina, la dirección IP, la fecha y la memoria ram libre. Los comandos utilizados para la resolución de estos se encuentra en: 
[script.sh](https://github.com/DanielCerquera13/sd-workshop1/blob/master/script.sh "script.sh")

#### Bonus
Para el bonus se pedía asignar las IP de manera dinámica para eso se realizó la instrucción **type: "dhcp"**, como se muestra en el siguiente cómando:

`config.vm.network "public_network", type: "dhcp"`
