#!/bin/bash


#On traite les options -a b
while getopts n:ip name   ## les options acceptant un paramètres sont suivies de ":"
  do
    case $name in
	n) #nom de domaine
	    NAME_SERVER="$OPTARG"
	    ;;
        ip) #Tmp
            IP="$OPTARG"
            ;;
        ?)
          #  printf "Usage: %s: [-a] [-b value] args\n" $0
            exit 2
            ;;
    esac
done



sudo apt-get install bind9


#
#Config
#

##named.conf.local : contient la liste des noms de domaine gérés par le serveur DNS (siteduzero.com, siteduzero.org...).

echo "zone \"$NAME_SERVER\" {
        type master;
        allow-transfer {$IP;} ;
        file \"/etc/bind/db.$NAME_SERVER\";
};" >>	/etc/bind/named.conf.local


##file "/etc/bind/db.siteduzero.com" : indique le nom du fichier qui contient la définition détaillée du nom de domaine et de ses sous-domaines. On l'appelle en général db.mondomaine.com.

echo "
; TTL (Time To Live)
$TTL        604800

; Informations générales
@        IN        SOA        siteduzero.com. root.siteduzero.com. (
                              2                ; Serial
                         604800                ; Refresh
                          86400                ; Retry
                        2419200                ; Expire
                         604800 )              ; Negative Cache TTL
;

; Enregistrements du domaine, des sous-domaines et correspondances IP
@       10800 IN      A         $IP
@       10800 IN      MX 10     $IP. 
@       10800 IN      MX 20     $IP. 
uploads 10800 IN      A         $IP 
dev     10800 IN      A         $IP
www     10800 IN      A         $IP" >> /etc/bind/db.$NAME_SERVER


