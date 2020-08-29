Vagrant.configure("2") do |config|

  (1..2).each do |i|
  config.vm.define "web-#{i}" do |web|
   web.vm.box = "centos/7"
   web.vm.network "private_network", type: "dhcp"
   web.vm.hostname = "web-#{i}"
   web.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]  
   end
   web.vm.provision "file", source: "./archivo.sh", destination: "archivo.sh"
   web.vm.provision "shell", inline: "./archivo.sh"
  end
end
end

