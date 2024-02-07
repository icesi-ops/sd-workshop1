## <b> COMMANDS </b> 

- *git clone* https://github.com/icesi-ops/training_microservices.git

- sudo su

- docker login

- docker network create distribuidos

- cd training_microservices/

- cd pay-app-spring-microservices/

- cd app-config/

- vim Dockerfile cambiar puerto al 8888

- docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0

- docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0

- docker run -p 5434:5432  --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine

- sudo docker build -t nicolasg1911/app-config .

- docker run -d -p 8888:8888 --network distribuidos --name app-config nicolasg1911/app-config:latest

- docker build -t nicolasg1911/app-invoice .

- docker run -d -p 8006:8006 --network distribuidos --name app-invoice nicolasg1911/app-invoice:latest
