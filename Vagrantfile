# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  (1..2).each do |i|
    config.vm.define "web-#{i}" do |web|
      web.vm.box = 'centos/7'
      web.vm.network 'private_network', type: 'dhcp'
      web.vm.provider 'virtualbox' do |vb|
        vb.customize ['modifyvm', :id, '--memory', '512', '--cpus', '1', '--name', "web-#{i}"]
      end
      web.vm.provision 'file', source: 'sources/', destination: 'src/'
      web.vm.provision 'shell', path: 'sources/script.sh'
      web.vm.provision 'shell', inline: <<-SHELL
        mkdir src/www/
        curl https://www.icesi.edu.co/es/ >> src/www/index.html
      SHELL
    end
  end
end
