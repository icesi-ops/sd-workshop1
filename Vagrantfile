Vagrant.configure("2") do |config|
config.vm.provision "file", source: "~/sd-workshop1/cod.sh", destination: "cod.sh"

config.vm.provision "shell", inline: "chmod +x cod.sh"
config.vm.provision "shell", inline: "./cod.sh"

(1..2).each do |i|
config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     config.vm.network "public_network", type: "dhcp"
     
     end
     
end
    
end
