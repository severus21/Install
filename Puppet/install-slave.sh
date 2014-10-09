#!/bin/bash

#Paquet esclave
apt-get install puppet


#Parfeu 
cat << EOF >> /etc/init.d/firewall.sh 
#Puppet
iptables -t filter -A INPUT -p tcp --dport 8140 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8140 -j ACCEPT
EOF
