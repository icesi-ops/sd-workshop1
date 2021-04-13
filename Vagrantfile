Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo ai"
  (1..1).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network", ip: "192.168.33.1#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "file", source: "scripts/", destination: "src"
     web.vm.provision "shell", inline: "src/script.sh"
     web.vm.provision "shell", inline: "src/script2.sh"
   end
  end
end
