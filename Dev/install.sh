#!/bin/bash

if [ whoami!="root" ]
then 
	echo "Droit root requis"
	return 0
fi



### Compilateurs, linker and other folks###
	apt-get install g++
	apt-get install make	
	apt-get install build-essential
	apt-get install cmake


### Bibliothèques ### 
##Boost
	apt-get install libboost-all-dev

##OpenCV
	cd Sources
	tar -zxvf Sources/opencv-2.4.6.1.tar.gz
	cd opencv-2.4.6.1
	mkdir release
	cd release
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
	make -j 6
	make install

	rm -r opencv-2.4.6.1
	



### IDE ### 
##Geany
	apt-get install geany

##Vim
	apt-get install vim
	cp -fv Config/vimrc /etc/vim/vimrc

## Qtcreator
	apt-get install qtcreator

##CodeBlocks
	apt-get install codeblocks

## WinCaml
	cd Sources
	7z X Sources/WinCaml5-src.zip 
	cd WinCaml5-src/Qt/lin
	chmod +x build.sh
	./build.sh
	rm -r WinCaml5-src


### Configurations spécifiques ###
##Php
	cp -fv Config/php.ini /etc/php5/apache2/php.ini





## Environnement de test
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - 
	echo "deb http://download.virtualbox.org/virtualbox/debian `lsb_release -sc` contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
	sudo apt-get update
	sudo apt-get install virtualbox-4.3




##
#Gumbo parser
	#Dependances
	sudo apt-get install libtool
	sudo apt-get install automake
	sudo apt-get install cmake

	sudo apt-get install libgtest-dev
	cd /usr/src/gtest
    	sudo cmake CMakeLists.txt
   	sudo make
    	sudo cp *.a /usr/lib


sudo /sbin/ldconfig -v

    	
	
