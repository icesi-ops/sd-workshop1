FROM debian:latest
MAINTAINER ROT7447@DEVOPS.COM

ENV DEBIAN_FRONTEND=nointeractive
RUN apt-get update
RUN apt install nginx -y
run service nginx start

run apt install -y wget
run wget www.youtube.com
run mv index.html /var/www/html

run service nginx restart


CMD ["nginx","-g","daemon off;"]
