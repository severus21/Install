#!/bin/bash

if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi

## MultiSystem
	#Ajout du Depôt de MultiSystem 
	apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'

 	#Ajout de la clé publique 
	wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | sudo apt-key add -

	apt-get update
	apt-get install multisystem

##Gparted
	apt-get install gparted

##digiKam
	apt-get install digiKam

##p7zip
	apt-get install p7zip-full
	apt-get install p7zip-rar

##vim
	apt-get install vim

## Lynx
	apt-get install lynx

#Iftop
	apt-get install iftop
#Iotop
	apt-get install iotop


