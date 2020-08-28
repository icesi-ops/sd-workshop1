Vagrant.configure("2") do |config|

 (1..3).each do |i|
  config.vm.define "web-#{i}-BM" do |web|
   web.vm.box = "centos/7"
   web.vm.network "private_network", type: "dhcp"
   web.vm.hostname = "web-#{i}-BM"
   web.vm.provider "vitrualbox" do |vb|
      vb.customize["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}-BM"]
   end
   web.vm.provision "file", source: "./script.sh", destination: "script.sh"
   web.vm.provision "shell", path: "script.sh"
   web.vm.provision "shell", inline: "echo hello from $HOSTNAME"
  end
 end
end
