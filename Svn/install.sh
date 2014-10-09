#!/bin/bash

if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi

apt-get install subversion

#On crée l'utilisateur svn
mkdir /var/svn
addgroup svn --system
adduser svn --system --home /var/svn --no-create-home --ingroup svn
chown -R svn:svn /var/svn

#On automatise le lancement au démarrage
svnserve -d


