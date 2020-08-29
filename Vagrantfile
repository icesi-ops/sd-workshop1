Vagrant.configure("2") do |config|
 config.vm.provision "shell", inline: "echo a"

 config.vm.define "web" do |web|
  web.vm.box = "centos/7"
  web.vm.provision "shell", inline: "echo b"
 end

 config.vm.define "db" do |db|
  db.vm.box = "centos/7"
  db.vm.provision "shell", inline: "echo c"
 end

 config.vm.provision "shell", inline: "echo d"
end
