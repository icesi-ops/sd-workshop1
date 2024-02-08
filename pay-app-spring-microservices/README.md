# Microservicios con Spring Boot

# Sebastian Navia.

# 1- First, I created the network.
docker network create distribuidos2
# 2- Then I built the config server image (appconfig).
#    Before, I opened the dockerfile to modify the gate to 8888.
docker build -t sebastiannavia/appconfig .
# 3- upload image to dockerhub
docker push sebastiannavia/appconfig
# 4- Then I built the config inoice image (appinvoice).
docker build -t sebastiannavia/appinvoice .
# 5- With the following command, correct the kafka service:
docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka1 --network distribuidos2 -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0
#    Note: "The 2.6.0 is added at the end of the line so that this version is compatible with my environment, however, the platform of the requested image does not match the platform of the detected host."
# 6- I start the postgres data-base
docker run -p 5434:5432  --name postgres1 --network distribuidos2 -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine
# 7- I sart the consul service
docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos2 --name consul1 consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0
# 8- Finally, I turned on appconfig and appinvoice services.
docker run -d -p 8888:8888 --network distribuidos2 --name appconfig sebastiannavia/appconfig:latest
docker run -d -p 8006:8006 --network distribuidos2 --name appinvoice sebastiannavia/appinvoice
# Create a folder called images to save your performance tests
