#!/bin/bash

#Paquet maitre
apt-get install puppetmaster

cp -v Conf/Master/puppet.conf /etc/puppet/puppet.conf

#Parfeu 
cat << EOF >> /etc/init.d/firewall.sh 
#Puppet
iptables -t filter -A INPUT -p tcp --dport 8140 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8140 -j ACCEPT
EOF
