cdb-public-vagrant
=====================

get started
-------------
git submodules:
> $ git submodule init 
> $ vagrant up
> profit


what this does:
----------------
* vagrant boots the VM 
* runs bootstrap.sh 
 * jumps into vagrant environment and does some intial setup/teardown of things that may still be running
 * installs python development stuff (move to image asap) 
 * pushd /vagrant/public/reddwarf-integration/scripts/; 
 * ./redstack install 
 * ./redstack kick-start mysql
 * sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
* profits
