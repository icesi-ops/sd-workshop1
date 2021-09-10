Vagrant.configure("2") do |config|
  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network", type: "dhcp"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "file", source: "src/", destination: "src"
     web.vm.provision "shell", inline: "chmod +x src/script.sh"
     web.vm.provision "shell", inline: "src/script.sh"
   end
  end
end
