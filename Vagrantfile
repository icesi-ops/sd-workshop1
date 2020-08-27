$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello a"

  (1..2).each do |i|
    config.vm.define "web-#{i}" do |web|
      web.vm.box = "centos/7"
      web.vm.network "private_network", ip: "192.168.33.1#{i}"
      web.vm.hostname = "web-#{i}"
      web.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
      end
      web.vm.provision :shell, inline: "echo iam  $HOSTNAME"
      web.vm.provision "shell", inline: $script
      #web.vm.provision "shell", path: "script.sh"
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "centos/7"
    db.vm.provision "shell", inline: "echo hello c"
  end

  config.vm.define "server" do |server|
    server.vm.box = "centos/7"
    server.vm.network "private_network", ip: "192.168.33.5"
    server.vm.provision "shell", inline: "echo I am server"
    server.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y httpd
      systemctl start  httpd.service
      systemctl enable httpd.service
    SHELL
  end

end

