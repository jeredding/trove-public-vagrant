#!/bin/bash

export PATH=/sbin/:/usr/sbin/:/usr/local/bin:/usr/local/sbin:$PATH
echo "starting redstack" 
pushd /vagrant/public/reddwarf-integration/scripts
echo "KILL SCREEN!!!" 
killall screen
echo "if we're rebuilding..."
if [[ -n "$REBUILDIMG" ]]; then
    rm ~/images/precise_mysql_image/*
    rmdir ~/images/precise_mysql_image
fi
echo "install some things:"
apt-get install -y  build-essential python-setuptools
echo "lets get started..."
su - vagrant -c "PATH=/sbin/:/usr/sbin/:/usr/local/bin:/usr/local/sbin:$PATH; 
pushd /vagrant/public/reddwarf-integration/scripts/; ./redstack install \
  && ./redstack kick-start mysql \
  && sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE"
