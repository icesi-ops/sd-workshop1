# PASOS A SEGUIR PARA DESPLEGAR LOS MICROSERVICIOS

### Crear la red para el proyecto

```
docker network create distribuidos
```

## Modificar los archivos de configuración de los servicios

### APP-CONFIG

Modificar el Dockerfile del servicio App-Config para cambiar el puerto que se va a exponer

Path -> training_microservices\pay-app-spring-microservices\app-config\

```
FROM openjdk:13-alpine as stage1
COPY . /app
WORKDIR /app
RUN chmod 777 gradlew
RUN ./gradlew clean
RUN ./gradlew bootJar


FROM openjdk:13-alpine
EXPOSE 8888
COPY --from=stage1 /app/build/libs/app-config-1.0.0.jar app-config.jar
#ADD ./build/libs/app-config-1.0.0.jar app-config.jar
ENTRYPOINT ["java", "-jar", "/app-config.jar"]
```

Modificar el archivo application.properties para hacer que apunte a las configuraciones alojadas en el repositorio propio que fue creado después de hacer fork al repositorio de ejemplo
Path -> training_microservices\pay-app-spring-microservices\app-config\src\main\resources\

```
# Server
spring.application.name=app-config
server.port=8888

# Config
spring.cloud.config.server.git.uri=https://github.com/JhormanMera/sd-workshop1.git
spring.cloud.config.server.default-label=master
spring.cloud.config.server.git.search-paths=pay-app-spring-microservices/config
spring.cloud.config.server.git.skip-ssl-validation=true

# Consul
spring.cloud.consul.host=consul
spring.cloud.consul.port=8500
spring.cloud.consul.discovery.health-check-interval=5s
spring.cloud.consul.discovery.prefer-ip-address=true
```

### APP-INVOICE

Modificar el Dockerfile del servicio App-Invoice para cambiar el puerto que se va a exponer
Path -> training_microservices\pay-app-spring-microservices\app-invoice\

```
FROM openjdk:13-alpine as stage1
COPY . /app
WORKDIR /app
RUN chmod 777 gradlew
RUN ./gradlew clean
RUN ./gradlew bootJar


FROM openjdk:13-alpine
EXPOSE 8006
COPY --from=stage1 /app/build/libs/app-invoice-1.0.0.jar app-invoice.jar
#ADD ./build/libs/app-config-1.0.0.jar app-config.jar
ENTRYPOINT ["java", "-jar", "/app-invoice.jar"]
```
Modificar el archivo build.gradle agregando las dependencias del consul para que el servicio App-invoice se registre en el consul

```
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.kafka:spring-kafka'
    implementation 'org.springframework.cloud:spring-cloud-starter-config'
    implementation 'org.springframework.cloud:spring-cloud-starter-consul-discovery'

    compileOnly 'org.projectlombok:lombok'
    runtimeOnly 'org.postgresql:postgresql'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testImplementation 'org.springframework.kafka:spring-kafka-test'
}
```

## CORRER LOS SERVICIOS DE CONSUL, KAFKA Y POSTGRES

### Consul

```
docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0
```
### Kafka

```
docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0

```

### Postgres

```
docker run -p 5434:5432  --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine
```

## CONSTRUIR Y CORRER LOS SERVICIOS DE APP-CONFIG Y APP-INVOICE

### App-config

Path -> training_microservices\pay-app-spring-microservices\app-config\

```
docker build -t jhormanmera/app-config .
docker run -d -p 8888:8888 --network distribuidos --name app-config jhormanmera/app-config:latest
```

### App-Invoice

Path -> training_microservices\pay-app-spring-microservices\app-invoice\

```
docker build -t jhormanmera/app-invoice .
docker run -d -p 8006:8006 --network distribuidos --name app-invoice jhormanmera/app-invoice:latest
```

## Publicar las imagenes en los repositorios de DockerHub

### App-config
```
docker push jhormanmera/app-config 
```
### App-Invoice
```
docker push jhormanmera/app-invoice 
```




