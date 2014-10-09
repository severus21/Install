#!/bin/bash

if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi

#Lecteur
	apt-get install vlc
