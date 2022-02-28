FROM kalilinux/kali
MAINTAINER 1144098778@u.icesi.edu.co

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt install -y nginx 
run service nginx start

RUN apt install -y wget
RUN wget www.bordacafe.com
RUN mv index.html /var/www/html

RUN service nginx restart

CMD ["nginx", "-g", "daemon off;"]

