## CAMILO ENRIQUEZ DELGADO

## DIFERENCIAS ENTRE CMD Y ENTRYPOINT
Las `ENTRYPOINT` especifican un comando que siempre se ejecuta cuando se inicia el contenedor.

El `CMD` especifica los argumentos que serán alimentados al `ENTRYPOINT`.

Si desea hacer una imagen dedicada a un comando específico, se utiliza `ENTRYPOINT ["/path/dedicated_command"]`

De lo contrario, si desea crear una imagen para fines generales, puede dejarla sin especificar `ENTRYPOINT` y usar, `CMD ["/path/dedicated_command"]` ya que podrá anular la configuración al proporcionar argumentos a 'docker run'.

## EVIDENCIAS

### Docker Corrriendo

![Docker Corriendo](https://user-images.githubusercontent.com/47835629/153266685-bd7d7581-ba98-4467-a0c6-67322b04d60d.png)

### Web Scrapping de Youtube.com usando debian

![Web Scrapping de Youtube.com usando debian](https://user-images.githubusercontent.com/47835629/153266819-5be13f9f-e3c1-428d-a74e-ee9844bc4056.png)



