FROM alpine:3.14
RUN apk update
RUN apk add nginx

# Add user to nginx server
RUN adduser \
    --disabled-password \
    --gecos 'nginx_www_user' \
    --home /home/www/ \
    server
# Set the working directory as /home/www
WORKDIR /home/www
# Delete default config that returns 404  
RUN rm /etc/nginx/http.d/default.conf
# Instead, replace it with custom configuration
COPY ./default.conf /etc/nginx/http.d/
# Add wget command in order to download a basic html from the internet
RUN apk add --no-cache wget
# Download the random basic.html to /usr/share/nginx/html folder
RUN wget "https://www.utm.edu/staff/jlofaro/Joe%20Lofaro's%20Dive%20Shop%20Project/basic.html" \
    -P /usr/share/nginx/html
# Exposes port 8080
EXPOSE 8080
# Starts nginx
CMD ["nginx", "-g", "daemon off;"]
