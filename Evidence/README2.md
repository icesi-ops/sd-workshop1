# sd-workshop1 2022-A

Un Dockerfile nos permite definir un comando a ejecutar por defecto, para cuando se inicien contenedores a partir de nuestra imagen. Tenemos 2 instrucciones para este propósito: ENTRYPOINT y CMD.
Si sólo especificas un CMD, entonces Docker ejecutará dicho comando usando el ENTRYPOINT por defecto, que es /bin/sh -c.

Si se sobre escriben los 2:
	El ENTRYPOINT especifica el ejecutable que usará el contenedor.
	CMD se corresponde con los parámetros a usar con dicho ejecutable.


## Referencias
 * https://programacionymas.com/blog/docker-diferencia-entrypoint-cmd#:~:text=El%20ENTRYPOINT%20especifica%20el%20ejecutable,a%20usar%20con%20dicho%20ejecutable.

 * La clase
