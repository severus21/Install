#!/bin/bash



if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi

apt-get update
apt-get upgrade
apt-get install p7zip-full
apt-get install p7zip-rar
apt-get install vim
#apt-get install lynx
#	   #
##	  ##
###Apache###
##	  ##
#	   #
echo "Installer apache (y/n)?"
read continu
if [ $continu = "y" ]
then

	#
	#Installation d'apache
	#
	apt-get install apache2

	#
	#configuration d'apache
	#   
		cp -fv Config/apache2.conf /etc/apache2/apache2.conf

		rm /etc/apache2/sites-available/default
		cp -fv Config/scientiavulgaria.org.conf /etc/apache2/sites-available/scientiavulgaria.org.conf
		#On supprime le lien symbolique de la configuration d'origine et on ajout le nouveau 
		a2dissite default
		a2ensite scientiavulgaria.org.conf
		
		echo "127.0.0.1 localhost scientiavulgaria.org" >>  /etc/hosts	

		#on active l'url rewriting
		a2enmod rewrite
		
		#on active la compression des pages
		a2enmod headers
		a2enmod deflate #a2dismod desactive
		
		cp -fv Config/mod_deflate.conf /etc/apache2/conf.d/mod_deflate.conf

		#Corresction erreur démarrage
		echo "ServerName localhost">>/etc/apache2/httpd.conf

#
#Module SSL 
#
	#Creation du dossier 
	mkdir /etc/apache2/ssl
	 
	#Activation du module
	a2enmod ssl
	service apache2 force-reload
	
	#On deplace la clef et le certificat
	cp -v Certificats/scientiavulgaria.org.crt /etc/apache2/ssl/scientiavulgaria.org.crt
    	cp -v Certificats/scientiavulgaria.org.key /etc/apache2/ssl/scientiavulgaria.org.key

	#Protection de la clef
	chmod 440 /etc/apache2/ssl/scientiavulgaria.org.key
	
	service apache2 restart	
fi


echo "Installer php5 (y/n)?"
read continu
if [ $continu = "y" ] 
then
#	   #
##	  ##
### PHP5 ###
##	  ##
#	   #

	#On install le PPA car par defaut on php5.3 sous Ubuntu12.04LTS
		#Pour pouvoir utiliser add-apt-repository
		apt-get install python-software-properties
		#Ajout du PPA
		add-apt-repository ppa:ondrej/php5
		#On met à jour la liste de paquets
		apt-get update
#
#Installation de Php5 avec le suport de MySQL
#
apt-get install php5
apt-get install php5-mysql


#
#Ajout de la configuration
#
cp -fv Config/php.ini /etc/php5/apache2/php.ini 
#cp -fv Config/php.ini /etc/php5/cli/php.ini 

#
#Installation des modules
#
	#GD
	apt-get install php5-gd
	service apache2 force-reload
	
	#mcrypt
	apt-get install php5-mcrypt
	
	#Curl
	apt-get install curl libcurl3 libcurl3-dev php5-curl

	#Memcached
	apt-get install memcached
	apt-get install php5-memcached  

fi


echo "Installer MySql (y/n)?"
read continu
if [ $continu = "y" ] 
then
	#	   #
	##	  ##
	### MySQL###
	##	  ##
	#	   #

	#
	#Installation
	#
	apt-get install mysql-server

	#
	#Configuration
	#
		#uft8
		echo character_set_server=utf8 >>  /etc/mysql/my.cnf 
		echo skip-character-set-client-handshake >>  /etc/mysql/my.cnf 
		
		#Creation et importation de la base de donnée 
		mysql -u root -p"rj7@kAv;8d7_e(E6:m4-w&" -e "CREATE DATABASE scientiavulgaria"
		mysql -u root -p"rj7@kAv;8d7_e(E6:m4-w&" -e "CREATE DATABASE forum"
		mysql -u root -p"rj7@kAv;8d7_e(E6:m4-w&" -D scientiavulgaria -e "SOURCE scientiavulgaria.sql"
		mysql -u root -p"rj7@kAv;8d7_e(E6:m4-w&" -D forum -e "SOURCE forum.sql"
		
fi


echo "Installer pwgen (y/n)?"
read continu
if [ $continu = "y" ] 
then
	#	  #
	##  	 ##
	###Pwgen###
	##	 ##
	#	  #

	#Genere des mots de passe aléatoirement
	apt-get install pwgen 

	#			#
	##		       ##
	###Gestion des droits ###
	##		       ##
	#			#

		#On donne les droits au dossier /var/www/
		chmod 700 -R /var/www/
		
		#On deplace le dossier source
		cp -fvr scientiavulgaria /var/www/scientiavulgaria
		#On creer le dossier dans /home
		mkdir /home/scientiavulgaria
		mkdir /home/scientiavulgaria/Files
		mkdir /home/scientiavulgaria/Files/Archives
		mkdir /home/scientiavulgaria/Files/Audios
		mkdir /home/scientiavulgaria/Files/Documents
		mkdir /home/scientiavulgaria/Files/Images
		mkdir /home/scientiavulgaria/Files/Tmpfiles
		mkdir /home/scientiavulgaria/Files/Videos
		
		#On créé les liens symboliques
		ln -s /home/scientiavulgaria/Files/Archives /var/www/scientiavulgaria/Web/Files/Archives
		ln -s /home/scientiavulgaria/Files/Audios /var/www/scientiavulgaria/Web/Files/Audios
		ln -s /home/scientiavulgaria/Files/Documents /var/www/scientiavulgaria/Web/Files/Documents
		ln -s /home/scientiavulgaria/Files/Images /var/www/scientiavulgaria/Web/Files/Images
		ln -s /home/scientiavulgaria/Files/Tmpfiles /var/www/scientiavulgaria/Web/Files/Tmpfiles	
		ln -s /home/scientiavulgaria/Files/Videos /var/www/scientiavulgaria/Web/Files/Videos

		
		
		#On augmente les droits de Web
		chmod 711 -R /var/www/scientiavulgaria/Web
		chmod 711 -R /home/scientiavulgaria
		
		#On change l'utilisateur 
		chown -R www-data:www-data /var/www/
		chown -R www-data:www-data /home/scientiavulgaria

		#On crée la crontab
		sudo -u www-data crontab -l > svcron	
		echo "0 * * * * php /var/www/scientiavulgaria/Cron/hourly.php" >> svcron
		echo "0 0 * * * php /var/www/scientiavulgaria/Cron/daily.php" >> svcron
		sudo -u www-data crontab svcron
		rm svcron
fi


echo "Installer Avconv (y/n)?"
read continu
if [ $continu = "y" ] 
then
	#	   #
	##	  ##
	###Avconv###
	##	  ##
	#          #
	apt-get install libav-tools
fi

echo "Secure server (y/n)?"
read continu
if [ $continu = "y" ] 
then
	#
	##
	###Modules apache
	##
	#
		apt-get install libapache2-mod-evasive
		
		#On crée le fichier de config
		cp -fv Config/mod-evasive.conf /etc/apache2/conf.d/mod-evasive.conf
		
		#Dossier stockant les IP blacklistées
		mkdir -p /var/lock/mod_evasive
		chown -R www-data:ww-data /var/lock/mod_evasive
		
		#On charge la config
		a2enmod mod-evasive
		service apache2 restart

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
fi


service apache2 restart
apt-get update
apt-get upgrade
