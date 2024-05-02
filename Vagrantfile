Vagrant.configure("2") do |config|
  config.vm.define "test-scripting"
  config.vm.box = "ubuntu/focal64"  # Puedes seleccionar otra versión de Ubuntu si lo prefieres.
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "provision.sh" # Crearemos este script en el siguiente paso.

end
