FROM alpine:latest
MAINTAINER cgp9923@gmail.com

# INSTALLING NGINX
RUN apk --no-cache update
RUN apk --no-cache add nginx
RUN apk --no-cache add openrc

# INSTALL WGET
RUN apk add wget

# WEBSITE SCRAPPING
RUN wget www.upc.edu
RUN mkdir /www
RUN mv index.html /www

# BACKUP NGINX CONFIGURATION FILE
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

# UPDATE NGINX Configuration File
COPY nginx.conf /etc/nginx/nginx.conf

# START NGINX SERVER WHEN REBOOT
RUN rc-update add nginx default

# AVOID CONTAINER'S PROCESS FINISH
CMD ["nginx", "-g", "daemon off;"]