sudo yum install -y wget
sudo yum install -y httpd
cd /var/www/html
wget www.icesi.edu.co
sudo chmod 777 /etc/httpd/conf/httpd.conf
cd /vagrant
cp httpd.conf /etc/httpd/conf
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

