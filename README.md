## DIFERENCIAS ENTRE CMD Y Entrypoint
Las 'ENTRYPOINT' especifican un comando que siempre se ejecuta cuando se inicia el contenedor.

El 'CMD' especifica los argumentos que serán alimentados al 'ENTRYPOINT'.

Si desea hacer una imagen dedicada a un comando específico, se utiliza 'ENTRYPOINT ["/path/dedicated_command"]'

De lo contrario, si desea crear una imagen para fines generales, puede dejarla sin especificar 'ENTRYPOINT' y usar, 'CMD ["/path/dedicated_command"]' ya que podrá anular la configuración al proporcionar argumentos a 'docker run'.

## EVIDENCIAS

