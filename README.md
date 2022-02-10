# Difference between CMD and ENTRYPOINT

Con CMD y ENTRYPOINT es posible especificar comandos a ejecutar en un contenedor de docker. La diferencia radica en que es posible hacerle override al CMD de manera simple mientras que hacerle override al ENTRYPOINT es con la directiva --entrypoint.

Esto quiere decir que cuando se corre un contenedor que contiene las directivas de CMD y ENTRYPOINT y al momento de correr dicho contenedor se le pasa un parametro como "hostname", entonces solo se ejecutan las directivas de ENTRYPOINT mas no las de CMD.

Es bastante comun combinar las directivas de CMD y ENTRYPOINT para hacer instrucciones que se ejecutan (ENTRYPOINT) con parametros variables (CMD).

# Web Scraping Dockerfile

Se hizo un Dockerfile capaz de hacerle web scraping a la pagina web de nike. Se utilizo la ultima imagen de Debian para hacer esto y el Dockerfile quedo almacenado en el repositorio.
A continuacion, se muestra el funcionamiento del contenedor:

### Build:
![Docker build 1](Build1.png "Docker build")
![Docker build 2](Build2.png "Docker build")

### Run:
![Docker run](Run.png "Docker run")

### Web scraping:
![Docker scraping](web_scraping.png "Web scraping")
