Vagrant.configure("2") do |config|
 config.vm.provision "shell", inline: "echo Hello"
 config.vm.network "private_network", type: "dhcp"
 config.vm.provision "file", source: "~/training_IaC/Vagrant/sd-workshop1/script.sh", destination: "script.sh"
 config.vm.provision "shell", inline: "./script.sh"
 (1..2).each do |i|
  config.vm.define "web-#{i}" do |web|
   web.vm.box = "centos/7"
   web.vm.hostname = "web-#{i}"
   web.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
   end
    web.vm.provision "shell", inline: "echo hello from $HOSTNAME"
  end  
 end
end

