Vagrant.configure("2") do |config|

	(1..3).each do |i|
		config.vm.define "web-#{i}" do |web|
		web.vm.box = "centos/7"
		#1.Assign IP with DHCP protocol
		web.vm.network "private_network", type: "dhcp"
		web.vm.hostname = "web-#{i}"
		web.vm.provider "virtualbox" do |vb|
			vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
		end
		web.vm.provision "shell", inline: "echo hello from $HOSTNAME"
		#2.Load script into VM
		web.vm.provision "file", source: "./script.sh", destination: "script.sh"
		#3.Run script in VM
		web.vm.provision "shell", path: "script.sh"
		end
	end
	
end