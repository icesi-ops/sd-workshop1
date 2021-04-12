# sd-workshop1

1. configurar un servidor web que sea scraping de icesi
2. dentro de script.sh print hostname, ip, timestamp(date), memoria ram free

#bonus
Asignación de direcciones ip sea dinamica
#solucion
Para cumplir el punto 1 se hizo lo siguiente: 

Primero instalar y configurar la vm con centos/7 que serviría de web. seguido, se descargó httpd en la vm para poder utilizar el servicio web y por útlimo se descargó el index.html de la página web de icesi con el comando `wget www.icesi.edu.co `en la carpeta `/var/www/html/ `para que pudiese ser cargado por el servidor de apache, y de esta forma se hizo el scraping. La configuración de la web se encuntra en el archivo serverconf.sh

Para cumplir el punto 2, se redactaron los comandos en elarchivo script.sh de la carpeta source. 

El bonus, el cual consistía en asignar la ip dinámica, se obordó cambiando el parámetro ip de la configuración de la primera máquina, a `type` y asignándole el valor de `"dhcp".` la configuración de esta segunda vm fue similar a la primera. en el archivo  dhcp.sh se encuentran los comandos. 

#ByMelqui