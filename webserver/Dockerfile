FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt install -y nginx
RUN service nginx start

RUN apt install -y wget
RUN wget www.facebook.com
RUN mv index.html /var/www/html/

RUN service nginx restart
CMD ["nginx","-g", "daemon off;"]