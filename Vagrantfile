(1..3).each do |i|
 config.vm.define "node-#{i}" do |node|
  node.vm.provision "shell",
   inline: "echoo hello from node#{i}"
  end
end
