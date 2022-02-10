from debian:latest
maintainer sleepata6@gmail.com

env DEBIAN_FRONTEND=nointeractive
run apt-get update
run apt install nginx -y
run service nginx start

run apt install -y wget
run wget www.nike.com/xl/
run mv index.html /var/www/html

run service nginx restart

CMD ["nginx","-g","daemon off;"]
