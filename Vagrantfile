Vagrant.configure("2") do |config|
 config.vm.provision "shell", inline: "echo Hello"

 config.vm.define "web" do |web|
  web.vm.box = "centos/7"
 end

 config.vm.define "db" do |db|
  db.vm.box = "centos/7"
 end
end
