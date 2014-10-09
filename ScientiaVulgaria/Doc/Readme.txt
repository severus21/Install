Attention pour la génération de la clé SSl : Common Name (eg, YOUR name) []: <=> nom de domaine
Password MySQL : rj7@kAv;8d7_e(E6:m4-w&  #Si modifié, penser à modifier PDOFactory


Attention : 
	Il faut créer un compte administrateur avant et lire entièrement!! ce fichier
	Si ip fixe modifier /etc/network/interfaces

Mail :
	Adr=scientiavulgariasecur@gmail.com 
	Mdp=ohp9oe5To@
	Description=
		fail2ban|portsentry|rkhunter|mod-evasive rapport.

Fichiers propre à chaque serveur :
	Config/issue.net : text par defaut lors d'une co ssh 

	Config/apache2.conf : utilisateur et groupe apache dans apache2.conf l62 à créer sur le serveur
	install.sh : l156 utilisateur possedant /var/www/
	
	Config/servername.tld.conf : nom de domaine et sous domaine 
		Attention par défaut un seul nom de domaine supporté scientiavulgaria.org 
		et le localhost point sur ce domaine : install.sh ligne 22/25/27/39
	
	Config/sshd_config: l92 compte admin

Gestion des langues :
	Application/*/Config/config.xml
	Application/*/Module/*/config.xml
	Table:
		héritant de catégorie
			reference
