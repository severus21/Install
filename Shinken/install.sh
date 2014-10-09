#!/bin/bash

apt-get install shinken

#Parfeu 
cat << EOF >> /etc/init.d/firewall.sh 
#shinken	
iptables -t filter -A INPUT -p tcp --dport 7767 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 7767 -j ACCEPT
EOF


#Web-UI init
cat << EOF >> /etc/skinken/shinken-specific.cfg


define module{
        module_name      WebUI
        module_type      webui

        host             0.0.0.0       ; mean all interfaces of your broker server
        port             7767

        # CHANGE THIS VALUE or someone may forge your cookies
        auth_secret      TOCHANGE

        # Allow or not the html characters in plugins output
        # WARNING: so far, it can be a security issue
        allow_html_output  0

        # Option welcome message
        #login_text             Welcome to ACME Shinken WebUI.

        #http_backend    auto
        # ; can be also: wsgiref, cherrypy, paste, tornado, twisted
        # ; or gevent. auto means best match in the system.
        modules          Apache_passwd,ActiveDir_UI,Cfg_password,Mongodb

        # Modules available for the WebUI:
        #
        #   Note: Choose one or more authentication methods.
        #
        #   Apache_passwd: use an Apache htpasswd files for auth
        #   ActiveDir_UI: use AD for auth and photo collect
        #   Cfg_password: use passwords in contacts configuration for authentication
        #
        #   PNP_UI: Use PNP graphs in the UI
        #   GRAPHITE_UI: Use graphs from Graphite
        #
        #   Mongodb: Necessary for enabling user preferences in WebUI
} EOF
