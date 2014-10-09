#!/bin/bash

### Browser ###

##Firefox
	apt-get install firefox

##Opera
	wget -q http://deb.opera.com/archive.key -O- | sudo apt-key add -
	echo "deb http://deb.opera.com/opera/ stable non-free" | sudo tee -a /etc/apt/sources.list.d/opera-webbrowser.list
	sudo apt-get update && sudo apt-get install opera


### P2P ###
	apt-get install transmission
	

