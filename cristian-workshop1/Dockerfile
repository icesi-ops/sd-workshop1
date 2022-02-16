FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND=noninteractive
MAINTAINER CristianGM 1002972140@u.icesi.edu.co

RUN apt -y update
RUN apt install -y  nginx
RUN service nginx start

RUN apt install -y wget
RUN wget tryhackme.com
RUN mv index.html /var/www/html

RUN service nginx restart

CMD [ "nginx", "-g", "daemon off;" ]
