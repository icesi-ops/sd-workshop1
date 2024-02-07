
# sd-workshop1 2024-1

# Steps to follow to deploy the config and invoice microservices.

- First, you must create the network and the images of the microservices configurations, both for config and invoice, to then run them in the following step:

	-docker network create distribuidos 
	-docker build -t luis486/app-config:0.0.1 
	-docker build -t luis486/app-invoice:0.0.1
  
- Then, you must run all services in a specific order to bring up the dependencies (according to the microservices being used):
        -First, run the Kafka service, which is a publish/subscribe system (pub/sub) that provides a "broker" for distributing events.
  
  	-docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0
  
- Then, start the Consul, which is commonly used for configuration management and service discovery.
  
	-docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0
  
- Next, start the PostgreSQL (the database that the invoice microservice will use).
  
	-docker run -p 5434:5432 --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=db_invoice -d postgres:12-alpine
  
- Finally, run the two services, first app-config and then app-invoice.
  
	-docker run -d -p 8888:8888 --network distribuidos --name app-config luis486/appconfig:0.0.1 
	-docker run -d -p 8006:8006 --network distribuidos --name app-invoice luis486
  

## Bonus
Servidor web que sea scraping de cualquier página web

PR a sd-workshop1
# Microservices

![alt text](https://i.ibb.co/3cQdDny/microservices.png)

There is no accepted definition of a microservice, you will find for example:
- > "Small autonomous services that work together" By: Sam Newman  
- > "In short, the microservice architectural style is a approach to developing a single application as a suite  of small services, each running in its own process and communicating with lightweight mecahcnism, often and HTTP..."  
- > "There is a bare minimun of centralized management of these services, which may be written in different programming languages and use different data storage technologies" by: Martin Fowler  

- REST
- And Small whell chosen deployable units
- And cloud enabled

### How Does it Look?

![alt tex](https://i.ibb.co/CWvrFry/microservices2.png)

## Microservices Advantages

- New Technology and Process Adaption
- Dynamic Scaling
- Faster Release Cycles

## Microservices Challenges

- Bounded Context:  ¿How do you identify the boundary for each os these microservices?  ¿How do you identify what to do in each of these microservices?  ¿How do you decide what you should do and what no?
- Configuration Management
- Dynamic Scale Up and Scale Down
- Visibility: If I say the functionality is now distributed among 10 microservices and there is a bug, How do you identify where the bug is?  
- Pack of cards: How do i prevent one microservices being down taking down entire application? ¿How do i build fault-tolerance?

### How we can solve all those challenges?

- CONTAINERIZATION
- ORCHESTATION

![alt text](https://i.ibb.co/8mbbpJ2/microservices3.png)

### References
· https://www.geeksforgeeks.org/todo-list-app-using-flask-python/
· https://github.com/cosmoshadab/todo-app-flask
· https://github.com/bhavaniravi/flask-tutorial/blob/master/app/app.
