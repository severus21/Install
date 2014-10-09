#!/bin/bash

	apt-get install postfix
	dpkg-reconfigure postfix	
	
	sudo postconf -e 'smtpd_sasl_local_domain ='
	sudo postconf -e 'smtpd_sasl_auth_enable = yes'
	sudo postconf -e 'smtpd_sasl_security_options = noanonymous'
	sudo postconf -e 'broken_sasl_auth_clients = yes'
	sudo postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination'
	sudo postconf -e 'inet_interfaces = all'


	echo "pwcheck_method: saslauthd" >> /etc/postfix/sasl/smtpd.conf
	echo "mech_list: plain login"  >> /etc/postfix/sasl/smtpd.conf
	
	#On genere le certificat TLS
	touch smtpd.key
	chmod 600 smtpd.key
	openssl genrsa 1024 > smtpd.key
	openssl req -new -key smtpd.key -x509 -days 3650 -out smtpd.crt # has prompts
	openssl req -new -x509 -extensions v3_ca -keyout cakey.pem -out cacert.pem -days 3650 # has prompts
	sudo mv smtpd.key /etc/ssl/private/
	sudo mv smtpd.crt /etc/ssl/certs/
	sudo mv cakey.pem /etc/ssl/private/
	sudo mv cacert.pem /etc/ssl/certs/

	#On configure postfix pr tls
	sudo postconf -e 'smtp_tls_security_level = may'
	sudo postconf -e 'smtpd_tls_security_level = may'
	sudo postconf -e 'smtpd_tls_auth_only = no'
	sudo postconf -e 'smtp_tls_note_starttls_offer = yes'
	sudo postconf -e 'smtpd_tls_key_file = /etc/ssl/private/smtpd.key'
	sudo postconf -e 'smtpd_tls_cert_file = /etc/ssl/certs/smtpd.crt'
	sudo postconf -e 'smtpd_tls_CAfile = /etc/ssl/certs/cacert.pem'
	sudo postconf -e 'smtpd_tls_loglevel = 1'
	sudo postconf -e 'smtpd_tls_received_header = yes'
	sudo postconf -e 'smtpd_tls_session_cache_timeout = 3600s'
	sudo postconf -e 'tls_random_source = dev:/dev/urandom'
	sudo postconf -e 'myhostname = smtp1.scientiavulgaria.org' # remember to change this to yours

	sudo /etc/init.d/postfix restart


## Authentication
#The next steps are to configure Postfix to use SASL for SMTP AUTH. 
	sudo apt-get install libsasl2-2 sasl2-bin  libsasl2-modules
	cp -v Config/saslauthd /etc/default/saslauthd
	sudo dpkg-statoverride --force --update --add root sasl 755 /var/spool/postfix/var/run/saslauthd
	sudo /etc/init.d/saslauthd start
		
