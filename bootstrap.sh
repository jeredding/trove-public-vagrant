#!/bin/bash
set -x
export PATH=/sbin/:/usr/sbin/:/usr/local/bin:/usr/local/sbin:$PATH
echo "starting tox" 
#pushd /vagrant/public/trove-integration/scripts
# echo "KILL SCREEN!!!" 
# killall screen
# echo "if we're rebuilding..."
# if [[ -n "$REBUILDIMG" ]]; then
#     rm ~/images/precise_mysql_image/*
#     rmdir ~/images/precise_mysql_image
# fi
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "---> setup and install some things:"
echo "ignore source repos for now..."
sed -i  -e 's/^\(deb-src.*\)/#\1/g' /etc/apt/sources.list
apt-get update 
apt-get install -y  build-essential python-setuptools python-software-properties python-dev
easy_install pip 
pip install tox
echo "get ppa for python2.6"
add-apt-repository --yes ppa:j5-dev/python2.6
apt-get update 
apt-get install -y python2.6 python2.6-dev libmysqlclient-dev libxml2-dev libxslt1-dev
echo "lets get started..."
echo 'PATH=/sbin/:/usr/sbin/:/usr/local/bin:/usr/local/sbin:$PATH;' >> /home/vagrant/.bash_profile
pushd /src/trove/
su - vagrant -c "tox" 