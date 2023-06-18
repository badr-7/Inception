#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_Name" ]; then

service mysql start
sleep 2
mysql << EOF
CREATE DATABASE $DB_Name;
GRANT ALL PRIVILEGES ON $DB_Name.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
sleep 2
service mysql stop
sleep 2
fi

mysqld_safe