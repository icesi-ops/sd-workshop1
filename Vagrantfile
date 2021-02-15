date >> src/hello.txt
car src/hello.txt
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.provision "shell", inline: "echo A"

  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
   config.vm.network "private_network", type: "dhcp"

     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network", ip: "192.168.33.1#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "file", source: "sources/", destination: "src"
     web.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y httpd
      systemctl start https.service
      systemctl enable httpd.service
     SHELL
     config.vm provision "shell", inline: "curl\" https://www.icesi.edu.co/es/"> /var/www/html/inde.html"
     web.vm.provision "shell", inline: $script
     web.vm.provision "shell", path: "script.sh"
     web.vm.provision "shell" do |s|
      s.inline = "echo$1"   
    end
   end

  config.vm.define "db" do |db|
   db.vm.box = "centos/7"
   db.vm.provision "shell", inline: "echo im db"
  end
end
