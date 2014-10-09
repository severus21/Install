#!/bin/bash

tar -zxvf sphinx-2.1.4-release.tar.gz
cd sphinx-2.1.4-release
./configure --prefix=/usr/local/sphinx
make -j 4
make install


#Config
cp Conf/sphinx.conf /usr/local/sphinx/etc/sphinx.conf

sudo ln -s /usr/local/sphinx/bin/indexer /usr/local/bin/indexer
sudo ln -s /usr/local/sphinx/bin/indextool /usr/local/bin/indextool
sudo ln -s /usr/local/sphinx/bin/search /usr/local/bin/search
sudo ln -s /usr/local/sphinx/bin/searchd /usr/local/bin/searchd
sudo ln -s /usr/local/sphinx/bin/spelldump /usr/local/bin/spelldump
