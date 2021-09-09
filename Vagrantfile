$script = <<-'SCRIPT'
sh Script.sh
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo ai"
  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
  config.vm.box = "hashicorp/bionic64"
     web.vm.hostname = "web-#{i}"
     
     web.vm.provision "file", source: "~/Desktop/Vagrant/sd-workshop1/Script.sh", destination: "./Script.sh"
     web.vm.provision "file", source: "~/Desktop/Vagrant/sd-workshop1/index.html", destination: "./index.html"
     web.vm.network "private_network", type: "dhcp"
     web.vm.provider "virtualbox" do |vb|
     web.vm.provision :shell, inline: $script
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     
   end
  end

  config.vm.define "db" do |db|
   db.vm.box = "hashicorp/bionic64"
  end

end


