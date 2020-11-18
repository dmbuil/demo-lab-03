#!/bin/bash

# Installation Process for CentOS

# Installs Apache, PHP and Dependencies
#yum update -y
yum install httpd php -y
#yum install php-{bcmath,bz2,cli,common,dba,devel,intl,gd,mbstring,mysql,zip} && sudo apt-get install libapache2-mod-php -y

systemctl enable httpd.service
systemctl restart httpd.service

#LAB_DATABASE_IP=`vmtoolsd --cmd "info-get guestInfo.ovfEnv" | grep 'lab.db.ip' | awk -F\" '{print $4}'`
#LAB_DATABASE_FQDN=`vmtoolsd --cmd "info-get guestInfo.ovfEnv" | grep 'lab.db.fqdn' | awk -F\" '{print $4}'`
#LAB_DATABASE_PASSWD=`vmtoolsd --cmd "info-get guestInfo.ovfEnv" | grep 'lab.db.password' | awk -F\" '{print $4}'`
#LAB_DATABASE_NAME=`vmtoolsd --cmd "info-get guestInfo.ovfEnv" | grep 'lab.db.name' | awk -F\" '{print $4}'`
#LAB_DATABASE_USER=`vmtoolsd --cmd "info-get guestInfo.ovfEnv" | grep 'lab.db.user' | awk -F\" '{print $4}'`

cp -r /tmp/dploy/jekyllsite-build/* /var/www/html/

firewall-cmd --add-service=http --permanent
firewall-cmd --reload
