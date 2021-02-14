Vagrant.configure("2") do |config|

  (1..2).each do |i|
    config.vm.define "web-server-#{i}" do |web|
      web.vm.box = "centos/7"
      config.vm.network "private_network", type: "dhcp"
      web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-server-${i}"]
      end
      web.vm.provision "shell", path: "script.sh"
      
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "centos/7"
    db.vm.provision "shell", inline: "echo im DB"
  end


end
