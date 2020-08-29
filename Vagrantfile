(1..2).each do |i|
 config.vm.define "web-#{i}" do |web|
  web.vm.box = "centos/7"
  web.vm.network "private_network", ip: "192.168.33.1#{i}"
  web.vm.hostname = "web-#{i}"
  web.vm.provider "virtualbox" do |vb|
   vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
  end
  web.vm.provision "shell", inline: "echo hello from $HOSTNAME"
 end
end
