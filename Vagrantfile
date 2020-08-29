
Vagrant.configure("2") do |config|
 (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     config.vm.network "private_network", type: "dhcp"  
      web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "file", source: "/home/ubuntu/sd-workshop1/script.sh", destination: "./script.sh"
   end
  end
 end 
