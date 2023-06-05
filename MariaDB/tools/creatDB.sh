#!/bin/sh

if [ ! -d "/var/lib/mysql/$DB_Name" ]; then

service mysql start

echo "CREATE DATABASE $DB_Name;" | mysql 

echo "DATABASE CREATED"

echo "GRANT ALL PRIVILEGES ON $DB_Name.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

echo "USER CREATED"

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'$hostname' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql

echo "ROOT USER CREATED"

echo "FLUSH PRIVILEGES;"| mysql

echo "FLUSH SUCCESSFULLY"

service mysql stop

fi

mysqld_safe