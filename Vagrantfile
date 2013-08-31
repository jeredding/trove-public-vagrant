# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
#Vagrant::Config.run do |config|
  config.vm.hostname = 'mynode.clouddb.rackspace.net'
  config.vm.box = "ubuntu12.04.2"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/165709740/boxes/precise64-vanilla.box"
  config.vm.provision :shell, :path => "bootstrap.sh"

# network
# config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :forwarded_port, guest: 8778, host: 8778 # reddwarf-api
  config.vm.network :forwarded_port, guest: 8779, host: 8779 # reddwarf-api
  config.vm.network :forwarded_port, guest: 5672, host: 5672 # rabbitmq
  config.vm.network :forwarded_port, guest: 55672, host: 55672 # rabbitmq management
  # Allows host-only access to the machine using a specific IP.
  # config.vm.network :private_network, ip: "172.16.0.2"
  
#  config.vm.customize do |vm|
#    vm.memory_size = 1024
#  end
  config.vm.synced_folder "public/trove/", "/src/trove/", owner: "vagrant", group: "vagrant"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1512"]
  end

end
