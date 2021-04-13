sudo yum install -y wget
sudo yum install -y httpd
cd/var/www/html
wget www.icesi.edu.co
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
