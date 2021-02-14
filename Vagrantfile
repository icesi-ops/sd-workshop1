# -*- mode: ruby -*-

Vagrant.configure("2") do |config|

    config.vm.define "web-icesi" do |web|
        web.vm.box = "centos/7"
        web.vm.hostname = "web-icesi"
        web.vm.network "private_network", type: "dhcp"
        web.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-icesi"]
        end
        web.vm.provision "shell", inline: <<-SHELL
            sudo yum install -y httpd
            systemctl start httpd.service
            systemctl enable httpd.service
            curl "https://www.icesi.edu.co/es/" > /var/www/html/index.html
        SHELL
        web.vm.provision "file", source: "sources/", destination: "src"
        web.vm.provision "shell", inline: "src/script.sh"
    end

end