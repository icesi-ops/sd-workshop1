Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo ai"
  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network", type: "dhcp"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "shell", inline: inline:  <<-SHELL
			echo "db web-#{i}"
			ifconfig
		SHELL
   end
  end

  config.vm.define "db" do |db|
   db.vm.box = "centos/7"
   web.vm.network "private_network", type: "dhcp"
   db.vm.provision "shell", inline:  <<-SHELL
		echo "db vm"
		ifconfig
		SHELL
	"ifconfig"
  end
end
