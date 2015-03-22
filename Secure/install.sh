#!/bin/bash



if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi
	## Gestionnaire mdp
	apt-get install -y keepassx

	#
	##
	###OpenSSH
	##
	#
		apt-get install openssh-server
		cp -fv Config/sshd_config  /etc/ssh/sshd_config
		#cp -fv Config/issue.net /etc/issue.net


#	    #
##         ##
###Iptable###
##	   ##
#	    #

		#On copie le fichier de configue du parfeu
		cp -fv firewall.sh /etc/init.d/firewall.sh
		
		#On execute le script
		chmod +x /etc/init.d/firewall.sh
		/etc/init.d/firewall.sh
		
		#On le définit comme regle par défaut du parfeu
		update-rc.d firewall.sh defaults



	#	       #
	##            ##
	###Portsentry###
	##	      ##
	#	       #

		#Lutte contre le scan de ports
		apt-get install portsentry
		
		#On copie les fichiers de config
		cp -fv Config/portsentry.conf /etc/portsentry/portsentry.conf
		
		#On execute protsentry (udp et tcp)
		portsentry –audp
		portsentry –atcp

	#	     #
	##          ##
	###Fail2ban###
	##	    ##
	#	     #

		#Utilitaire se basant sur les logs pour lutter contre diverse méthodes d'intrusions(brute-fvorce, dictionnaire, déni de service)
		apt-get install fail2ban
		
		#Copie des fichiers de config
		cp -fv Config/jail.conf /etc/fail2ban/jail.conf
		cp -fv Config/apache-w00tw00t.conf /etc/fail2ban/filter.d/apache-w00tw00t.conf
		
		#On recharge la nouvelle config
		/etc/init.d/fail2ban restart


	#	     #
	##          ##
	###Rkhunter###
	##	    ##
	#	     #

		#Detecte les rookits
		apt-get install rkhunter
		
		#Copie fichiers config
		cp -fv  Config/rkhunter /etc/default/rkhunter

	#	     #
	##          ##
	###Logwatch###
	##	    ##
	#	     #

		#Resume les logs
		apt-get install logwatch 
		
		#Copie des fichiers de config
		cp -fv Config/logwatch.conf /usr/share/logwatch/default.conf/logwatch.conf

	#
	##
	###ClamAv
	##
	#
		add-apt-repository ppa:ubuntu-clamav/ppa
		apt-get install clamav
		#on met à jour les signatures
		freshclam
		#On charge le script de maj auto
		cp -fv clamav.sh /etc/cron.daily/clamav.sh
		chmod 700 /etc/cron.daily/clamav.sh


service apache2 restart
apt-get update
apt-get upgrade
