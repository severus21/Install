#!/bin/bash
path=`dirname $0`
#cp -fv $path+"Config/apache2.conf" /etc/apache2/apache2.conf

cp -fv Config/apache2.conf /etc/apache2/apache2.conf
cp -fv Config/scientiavulgaria.org.conf /etc/apache2/sites-available/scientiavulgaria.org.conf
cp -fv Config/mod_deflate.conf /etc/apache2/conf.d/mod_deflate.conf
cp -fv Config/php.ini /etc/php5/apache2/php.ini
cp -fv Config/sshd_config  /etc/ssh/sshd_config
	cp -fv Config/issue.net /etc/issue.net
cp -fv Config/mod-evasive.conf /etc/apache2/conf.d/mod-evasive.conf
cp -fv firewall.sh /etc/init.d/firewall.sh
cp -fv Config/portsentry.conf /etc/portsentry/portsentry.conf
cp -fv Config/jail.conf /etc/fail2ban/jail.conf
	cp -fv Config/apache-w00tw00t.conf /etc/fail2ban/filter.d/apache-w00tw00t.conf
	cp -fv  Config/rkhunter /etc/default/rkhunter
	cp -fv Config/logwatch.conf /usr/share/logwatch/default.conf/logwatch.conf
	cp -fv clamav.sh /etc/cron.daily/clamav.sh
