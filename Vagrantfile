  Vagrant.configure("2") do |config|
  config.vm.define "servidorwebicesi" do |servidorwebicesi|
    servidorwebicesi.vm.box = "centos/7"
    servidorwebicesi.vm.hostname = "icesiser"
    servidorwebicesi.vm.network  "private_network", ip:"192.168.2.15"   
     servidorwebicesi.vm.provision "file", source: "sources/", destination: "src"
     servidorwebicesi.vm.provision "shell", inline: <<-SHELL
     
       
       sudo yum install -y httpd
       sudo yum install nano
       sudo echo "NameVirtualHost *:80

<VirtualHost *:80>
    ServerAdmin jaimecardona364@gmail.com
    ServerName icesi.com
    ServerAlias www.icesi.com
    DocumentRoot /var/www/html/icesi.com/
    ErrorLog /var/log/httpd/icesi.com/error.log
    CustomLog /var/log/httpd/icesi.com/access.log combined
</VirtualHost>" >> /etc/httpd/conf.d/vhost.conf
       sudo mkdir -p /var/www/html/icesi.com
       sudo mkdir -p /var/log/httpd/icesi.com
       sudo curl https://www.icesi.edu.co/es/  > /var/www/html/icesi.com/index.html 
       
       echo "el nombre del host es:"
       hostname -f
       echo "la direccion ip es:"
       hostname -I
       echo "el timestap es:"
       date +%s
       echo "informacion de la memoria RAM: "
       free -h
       
       systemctl start httpd.service
       systemctl enable httpd.service
     SHELL
   end

  config.vm.define "cliente" do |cliente|
    cliente.vm.box = "centos/7"
  end
end



