#!/bin/bash

NAME=""
MAIL=""
#On traite les options 
while getopts n:m: name   ## les options acceptant un paramètres sont suivies de ":"
  do
    case $name in
        n) #Scripts 
            NAME="$OPTARG"
            ;;
	m) #Scripts 
            MAIL="$OPTARG"
            ;;
        ?)
			printf "Usage: %s: [-d directory] [-n name] args\n" $1
            exit 2
            ;;
    esac
done



sudo apt-get install git

##
# Config du client 
##
git_local_conf=/home/$NAME/.gitconfig 
if [[ ! -e $git_local_conf ]] then 
	touch $git_local_conf	
	echo "[user]" >>  $git_local_conf
    	echo "email = $MAIL"  >> $git_local_conf
    	echo "name =  $NAME"  >> $git_local_conf
fi
