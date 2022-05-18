FROM  centos:centos7

RUN yum update -y
RUN yum install httpd -y
RUN yum install wget -y
RUN echo "ServerName 127.0.0.1" >> /etc/httpd/conf/httpd.conf
WORKDIR /var/www/html/



#RUN rm index.html
RUN wget  magic.wizards.com

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"] 
