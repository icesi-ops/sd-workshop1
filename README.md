# sd-workshop1 2021-B
Christian Gallo - A00098992

## CMD vs Entrypoint

La diferencia semántica de utilizar un CMD o un Entrypoint radica en que 
se utiliza el CMD cuando se desea tener la flexibilidad de especificar un
comando adicional al ejecutar el contenedor, mientras que al usar el 
ENTRYPOINT queremos especificar que el contenedor se debe ejecutar sin
un comando adicional al iniciar este.

Específicamente, esto es así debido a que al utilizar un CMD, esta instrucción
será ignorada o sobrescrita al iniciar el contenedor con un comando adicional, algo 
que no sucede por defecto con el ENTRYPOINT, pues se puede utilizar el flag de
"--entrypoint". 

Finalmente, otro caso es cuando se utilizan ambos comandos al mismo tiempo, lo especificado
en el CMD pasará como argumento al comando especificado en el ENTRYPOINT.
