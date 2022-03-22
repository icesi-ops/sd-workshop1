FROM debian:latest
LABEL mantainer = "javierandrestorresreyes@gmail.com"

# Simple apache server
RUN apt-get update
RUN apt-get install -y apache2

#Install wget
RUN apt-get install -y wget

#Clone google in /var/www/html
WORKDIR /var/www/html
RUN rm index.html
RUN wget http://isitfridayyet.net/

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]