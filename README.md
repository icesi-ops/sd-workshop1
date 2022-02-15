# Javier Torres - A00352115

# Diferencias CMD y Entrypoint
Ambos permiten ejecutar comandos cuando se inicia el contenedor. Sin embargo, es fácil hacerle override a un comando especificado con CMD, mas no a uno con Entrypoint.
CMD también permite definir parámetros por defecto, por lo que es posible combinar ambas instrucciones, Entrypoint para definir un ejecutable para el contenedor, y CMD para definir sus parámetros que pueden modificarse fácilmente.