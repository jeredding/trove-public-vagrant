# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
#Vagrant::Config.run do |config|
  config.vm.hostname = 'mynode.clouddb.rackspace.net'
  config.vm.box = "ubuntu12.04.1"
  config.vm.box_url = "http://dl.dropbox.com/u/1537815/precise64.box"
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
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1512"]
  end

#  config.vm.provision :puppet do |puppet|
#    puppet.manifest_file = "site.pp"
#    puppet.options = ["--fileserverconfig=/vagrant/fileserver.conf", "--verbose", "--debug" ]
#  end
end
