# sd-workshop1 2021-B
- make that IP assignament dynamically  
- Use config.vm.provision "file" to transfer a file from your host machine to your guest machine. THis file is a bash script that print HOSTNAME+IP+Timestamp server+DIsk space avaialable+proccess running+the most consuming process.  
- use config.vm.provision "shell" to execute the file that you transfered  

## Bonus
Servidor web que sea scraping de cualquier página web

PR a sd-workshop1


# <b> *Training Microservices* </b>



## <b> STEPS </b> 📄

fork and clone the next repository: 
- *git clone* https://github.com/icesi-ops/training_microservices.git

The firt step docker login

- sudo docker login

Create a network for microservices

- docker network create distribuidos

Moving to the corresponding folders to begin

- cd training_microservices/

- cd pay-app-spring-microservices/

- cd app-config/

Change the dockerfile, change port 8888

- vi Dockerfile

- docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0

-  docker ps para revisar

- docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0

- sudo docker run -p 5434:5432  --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine

- sudo docker build -t camilogonzalez7424/app-config .

- docker run -d -p 8888:8888 --network distribuidos --name app-config camilogonzalez7424/app-config:latest

Add next dependences to build.gradle of invoce

- implementation 'org.springframework.cloud:spring-cloud-starter-consul-discovery'
-implementation 'org.springframework.boot:spring-boot-starter-actuator'

And build app-invoce

- docker build -t camilogonzalez7424/app-invoice .

- docker run -d -p 8006:8006 --network distribuidos --name app-invoice camilogonzalez7424/app-invoice:latest



## <b> Built with </b> 🛠


+ [Docker](https://www.docker.com/) - Docker is an open platform for developing, shipping, and running applications.


## **Versioned** 📌

<div style="text-align: left">
    <a href="https://git-scm.com/" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/2ae2a900d2f041da66e950e4d48052658d850630/icons/git/git-original.svg" height="60" width = "60" alt="Git"></a> 
    <a href="https://github.com/" target="_blank"> <img src="https://img.icons8.com/fluency-systems-filled/344/ffffff/github.png" height="60" width = "60" alt="GitHub"></a>
</div>


## <b> Overview </b> 💻🕹

<img width="666" alt="image" src="https://github.com/icesi-ops/training_microservices/assets/69222739/9309a3ea-9106-47d0-b116-dd48b4daa8bc">


<br></br>

![done](https://github.com/icesi-ops/sd-workshop1/assets/69222739/b8c26e3c-5630-4f76-9892-8b948c1558f8)


## <b> Made by </b>


+ [Camilo González Velasco](https://github.com/camilogonzalez7424 "Camilo G.")
+ [Icesi-Ops](https://github.com/icesi-ops")




<br>



[![forthebadge](https://forthebadge.com/images/badges/docker-container.png)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

