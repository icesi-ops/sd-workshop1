# Microservicios con Spring Boot

![Architecture](./resources/microservicesarchitecture.png)

## Información de los microservicios
El microservicio de invoices, debe listar las facturas de clientes y además debe consumir una cola para cambiar el estado de la factura cuando esta se paga a través del microservicio de pago.
El microservicio de pago debe registrar el pago en su respectiva bd y además debe dejar un mensaje en una cola para actualizar la factura en el microservicio de facturas y además debe dejar un mensaje en una cola para registrar el movimiento en el microservicio de transacciones.
El microservicio de transacciones debe listar las transacciones de una factura, además debe consumir una cola para obtener las transacciones de pago del microservicio de pago.
Todos los microservicios deben consumir la cadena de conexión desde el servicio de configuración centralizada.

La información de los endpoints disponibles por microservicio se incluyen en el documento de INFO.md
## Scripts de creación de bases de datos

La informacion de como crear las bases de datos y sus respectivas tablas se incluyen en google.com

## Tecnologías utilizadas

- Spring Boot (Java Framework JDK v11+)
- Gradle (Gestor de dependencias)
- Postman (Test de endpoints/servicios rest)
- Postgresql (Base de Datos)
- MySQL (Base de Datos)
- MongoDB (Base de Datos NoSQL)
- Kafka (Gestor de Mensajería)
- Github (Repositorio para proyecto y Configuraciones de micorservicios)

# SD-WORKSHOP-1

First of all, we must make a Fork to the base repository and clone it in our computer. 

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/a6afa1a1-dc92-47da-99a6-d982328e4649)

## APP-CONFIG
 
Once cloned we must enter the address where we find the app-config folder, in which we must continue with the following steps:
- We change inside the Dockerfile the port used by 8888.
- In the build.gradle file we comment the Consul dependency.
- Inside the resources address, we comment the Consul lines.

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/3d3fe9b6-a6e1-4b22-aa04-227813c4d0e4)

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/d0c20954-ce54-4249-94fc-668e45ea52e2)

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/030335c2-af87-411a-bdf5-a71d9e62e947)

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/d7a82fbb-a7ca-45b2-86e2-82de7995e1d1)


Then we proceed to create a network by the name of distributed, as shown in the following image: 

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/f70851c1-a303-4449-9326-a09676c69665)


Now we build the app-config:0.0.1 image:
 
 ![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/e0d5b92a-5f92-4321-808a-2dd71358f003)


Finally we run the created image with the created network:

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/26546010-416f-48c4-8b5d-3b9972200de5)
 
Test run

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/e5a9a23f-3002-4b10-beb1-fc55dbee5dde)


We upload the changes made to the DockerHub.

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/ce269700-e7ee-4778-af5a-2ffd13a9d3ec)

 
## APP-INVOICE 
In order to run the app-invoice we must run the PostgresSQL and Kafka images as follows.

 ![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/e70405b7-cc3a-41b8-96a9-88a80d29042e)

 ![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/1adc1b7e-d5b4-4558-ad7d-cc5ca3613a77)

 
Now, entering the Dockerfile of the app-invoice, we change the port to 8006.

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/c909ea29-7645-41ba-bdc9-9350d6c83e0a)
 
Then we can build the image just like with app-config:

 ![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/c40b6637-946c-47c5-81c0-5fb9a4575e7f)

 
We run the app-invoice:

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/1bcc1bc7-5c71-4612-ae15-f8a4052726be)

Now, we insert to postgres db_invoice in the table invoice the data.

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/3e5523f0-6dcf-4d9d-84f3-bdae42eef09d)

Testing:

![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/1299b957-b69c-42a4-9689-c659e9f16169)


Finally we upload the changes
 
![image](https://github.com/SGutierrez-11/sd-workshop1/assets/69949511/17e43959-324a-42a4-a772-53d0ef50166e)






