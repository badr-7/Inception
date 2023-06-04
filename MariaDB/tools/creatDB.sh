#!/bin/sh

service mysql start

echo "CREATE DATABASE $DB_Name;" | mysql 

echo "CREATE USER $username@$hostname IDENTIFIED BY $password;" | mysql

echo "GRANT ALL PRIVILEGES ON $DB_Name TO $username@'%';" | mysql

echo "FLUSH PRIVILEGES;"| mysql


mysqld_safe