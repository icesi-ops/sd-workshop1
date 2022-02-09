FROM debian:latest

RUN apt-get update
RUN apt-get install nginx -y

RUN apt install wget -y

#RUN wget www.icesi.edu.co
RUN wget https://www.nike.com/xl/
#RUN rmv index.html /var/www/html/index.html
RUN mv index.html /var/www/html
RUN apt-get install vim -y


RUN service nginx restart


CMD ["nginx","-g","daemon off;"]



