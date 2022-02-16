![Docker logo](https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png)
# ENTRYPOINT
El entrypoint, es un método en el cual podemos dar una entrada para poder interactuar con la imagen Docker.
Este punto de entrada esta relacionado a la misma interacción que se tiene con la consola de comandos es por esto que, podemos usarlo de 3 maneras.
  1. Como un punto ejecutable, aquí podríamos indicar un ejecutable para cambiar el punto de ejecución por defecto que es /bin/sh -c 
  2. Como un comando de consola de la forma <*instrucción*> <*comando*> 
  3. Como un comando de consola de la forma <*servicio*> <*parametro1*> <*parametrpo2* <*etc*> 
  
  Cabe recalcar que el entrypoint podríamos tomarlo como un comando no sobreescribible pero si parametrizable 

# CMD
Es también un punto de entrada para la interacción con la imagen, sin embargo, tiene 5 formas de interactuar 
  1. Como un punto ejecutable, aquí podríamos indicar un ejecutable para cambiar el punto de ejecución por defecto que es /bin/sh -c pero deberá tener un comando después debido a que el CMD no recibe parámetros desde el Docker run sino que se sobrescribe 
  2. Como un comando que va a correr en el entrypoint por defecto de la forma <*instrucción*> <*comando*> 
  3. Como un comando que va a correr en el entrypoint por defecto de la forma <*servicio*> <*parametro1*> <*parametrpo2* <*etc*> 
  4. Como un parámetro de la forma *CMD [ parámetro ] ENTRYPOINT [ejecutable que recibe cmd parámetro]* 
  5. Como un parámetro sobre escrito desde el Docker run.
  
  Cómo se puede apreciar el cmd además de ser un comando de consola sirve para dar entrada o como un uso sobrescrito.
