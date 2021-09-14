Vagrant.configure("2") do |config|

  (1..2).each do |i|
   config.vm.define "machine-#{i}" do |machine|
     machine.vm.box = "centos/7"
     machine.vm.hostname = "machine-#{i}"
     machine.vm.network "private_network", type: "dhcp"
    
     machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "machine-#{i}"]
     end
     machine.vm.provision "file", source: "sources/script.sh", destination: "script.sh"
     machine.vm.provision "shell", inline: "chmod +x script.sh"
     machine.vm.provision "shell", inline: "./script.sh"

     machine.vm.provision "shell", inline: "sudo yum install wget -y"
     machine.vm.provision "shell", inline: "echo instaló el wget"
     machine.vm.provision "shell", inline: "sudo yum install -y nginx"
     machine.vm.provision "shell", inline: "sudo systemctl start nginx"
     machine.vm.provision "shell", inline: "echo se instaló y se inició el nginx"
     machine.vm.provision "shell", inline: "sudo wget https://www.icesi.edu.co/es/"
     machine.vm.provision "shell", inline: "sudo curl --version"
     machine.vm.provision "shell", inline: "sudo curl -I www.icesi.edu.co"

    #machine.vm.provision "shell", inline: "sudo wget https://ftp.opera.com/pub/opera/desktop/78.0.4093.112/linux/operastable_78.0.4093.112_amd64.rpm"

    
    #machine.vm.provision "shell", inline: "sudo yum localinstall opera-stable_78.0.4093.112_amd64.rpm -y"
   
    #machine.vm.provision "shell", inline: "wget --mirror --convert-links --page-requisites --no-parent -P / https://www.icesi.edu.co/es/"
    # machine.vm.provision "shell", inline: "cd www.icesi.edu.co"
    #machine.vm.provision "shell", inline: "opera index.html"
     
   end
  end
end


