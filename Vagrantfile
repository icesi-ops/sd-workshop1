#Workshop1
Vagrant.configure("2") do |config|

   (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web--#{i}"
          web.vm.network "private_network", ip: "192.168.30.1#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
    
     web.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y httpd
      sudo chmod u+x /var/www/html/index.html
      curl https://www.icesi.edu.co/es/ >> /var/www/html/index.html
      systemctl start httpd.service
      systemctl enable httpd.service
     SHELL
     
     web.vm.provision "shell", path: "script.sh"
   end
  end

 end
