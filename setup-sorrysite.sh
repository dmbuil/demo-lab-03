#!/bin/bash

# Installation Process for CentOS

# Installs Apache, PHP and Dependencies
#yum update -y
yum install httpd -y

systemctl enable httpd.service
systemctl restart httpd.service

cp -r /tmp/dploy/sorrysite-build/* /var/www/html/

firewall-cmd --add-service=http --permanent
firewall-cmd --reload
