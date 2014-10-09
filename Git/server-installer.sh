

REPOSITORY=""
#On traite les options 
while getopts r: name   ## les options acceptant un paramètres sont suivies de ":"
  do
    case $name in
        r) #Scripts 
            REPOSITORY="$OPTARG"
            ;;
        ?)
			printf "Usage: %s: [-d directory] [-n name] args\n" $1
            exit 2
            ;;
    esac
done


##
#	Creation de l'user
##
	sudo adduser git
	sudo su git
	cd ~
	mkdir .ssh

##
#	Repository creation if needed
##
	if [[ "$REPOSITORY" != "" ]]; then 

	fi
