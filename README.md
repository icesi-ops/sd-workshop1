# sd-workshop1 2022-A

# Diferencias entre CMD y ENTRYPOINT

-CMD es un comando aplicado a servicios y los parametros evita que se cierre, es persistente y reescribirle
-ENTRYPOINT no es reescribible y especifica el ejecutable que usa el contenedor. 

Por lo tanto, si solo usamos el comando CMD, el ENTRYPOINT será predeterminado, en cambio al usar ambos comandos ENTRYPOINT será el encargado de especificar el ejecutable del contenedor y CMD se utiliza como los parametros del ejecutable. 
