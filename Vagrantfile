Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo ai"
  (1..2).each do |i|
   config.vm.define "prueba-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "prueba-#{i}"
     web.vm.network "private_network", type:"dhcp"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "prueba-#{i}"]
     end
     
     web.vm.provision "file", source: "sources/script.sh", destination: "./script.sh"
     #dos2unix is called to change the format of the file
     #It must have been installed in the machine before running the vagrant -provision command
     #Using the following command: sudo yum install dos2unix
     web.vm.provision "shell", inline: "dos2unix script.sh"
     web.vm.provision "shell", inline: "chmod +x script.sh"
     web.vm.provision "shell", inline: "./script.sh"
     
    
   end
  end
end

