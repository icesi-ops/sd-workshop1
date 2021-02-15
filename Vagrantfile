
Vagrant.configure("2") do |config|


  config.vm.provision :shell, inline: "echo A"
  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network",ip: "192.168.33.1#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "file", source: "sources/", destination: "src"
     web.vm.provision "shell", inline:  <<-SHELL
      sudo yum install -y httpd
      cp src/index.html /var/www/html
      systemctl start httpd.service
      systemctl enable httpd.service
      SHELL
     web.vm.provision "shell", path: "script4.sh"
   end
  end

  config.vm.define "db" do |db|
   db.vm.box = "centos/7"
   db.vm.provision "shell", inline: "echo c"
  end

  config.vm.provision :shell, inline: "echo d"
end
