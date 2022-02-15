FROM debian:latest
LABEL MAINTAINER 1143877300@u.icesi.edu.co
RUN apt-get update && apt-get install -y nginx
RUN ls
COPY index.html /var/www/html/index.html
COPY index.html /usr/share/html/x.html
RUN rm -v /etc/nginx/nginx.conf
RUN rm -v /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/sites-enabled/default
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]