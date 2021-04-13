$script = <<-SCRIPT 
echo Im provisiing
date >> src/hello.txt
cat src/hello.txt
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.provision "shell", inline: "echo A"

  (1..2).each do |i|
    config.vm.define "web-#{i}" do |web|
      web.vm.box = "centos/7"
      web.vm.hostname = "web-#{i}"
      # To configure a ip address to DHCP 
      web.vm.network "private_network", type: "dhcp"
      web.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
      end

      # To shell provision
      web.vm.provision "file", source: "sources/", destination: "src"
      web.vm.provision "shell", inline: <<-SHELL
        sudo yum install -y httpd
        systemctl start https.service
        systemctl enable httpd.service
      SHELL
      #configure file script.sh
      web.vm.provision "shell", inline: $script
      web.vm.provision "shell", path: "script.sh"

      # TO configure scraping to icesi
      web.vm.provision "shell", inline: "curl\"https://www.icesi.edu.co/es/\"> /var/www/html/index.html"
   end
   
  end
config.vm.define "db" do |db|
  db.vm.box = "centos/7"
  db.vm.provision "shell", inline: "echo db"
end
end
