# This script saves the current date on the /etc/vagrant_provisioned_at file.
$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

# All vagrant configuration is done below. The "2" in VAgrant.configure
# configures the configuration version.
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello a"
  
  # Two virtual machines are created below.
  (1..2).each do |i|
    config.vm.define "web-#{i}" do |web|
      # Both machines use the CentOS 7 OS.
      web.vm.box = "centos/7"

      # The ip address is assigned via DHCP.
      web.vm.network "private_network", type: "dhcp"

      # The hostname is set to web-n, being n the number of VM.
      web.vm.hostname = "web-#{i}"

      # The physical attributes for both machines are as configured below.
      web.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
      end

      # Here, each VM will print its hostname and will run the script
      # defined at the beginning of this Vagrantfile in the $script variable.
      web.vm.provision :shell, inline: "echo iam  $HOSTNAME"
      web.vm.provision "shell", inline: $script

      # This creates the folder on which scripts will be saved, and changes
      # the permiossions of the created folder.
      web.vm.provision "shell", inline: <<-SHELL
        mkdir /home/scripts
        chmod 777 /home/scripts
      SHELL

      # The script getNameIpTimestamp.sh located in the host machine is uploaded
      # to the /home/scripts folder in the virtual machine (using provision "file")
      # and then the script is run in the VM.
      web.vm.provision "file", source: "./scripts", destination: "/home/scripts"
      web.vm.provision "shell", inline: "/bin/bash /home/scripts/getNameIpTimestamp.sh"
    end
  end

  # A virtual machine is created below. This VM uses the CentOS 7 OS and its ip address
  # is assigned via DHCP.
  config.vm.define "db" do |db|
    db.vm.box = "centos/7"
    db.vm.network "private_network", type: "dhcp"
    db.vm.provision "shell", inline: "echo hello c"
  end

  # An Apache server is created below. This server uses th CentOS 7 OS and its ip address
  # is assigned via DHCP.
  config.vm.define "server" do |server|
    server.vm.box = "centos/7"
    server.vm.network "private_network", type: "dhcp"
    server.vm.provision "shell", inline: "echo I am server"
    
    # Here, Apache is downloaded and started.
    server.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y httpd
      systemctl start  httpd.service
      systemctl enable httpd.service
    SHELL
  end

end

