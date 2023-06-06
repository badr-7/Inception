#!/bin/sh

# cat << EOF >> /etc/php/7.3/fpm/pool.d/www.conf
# [www]
# listen = 9000
# EOF

mkdir -p /var/www/html

cd /var/www/html

wget http://wordpress.org/latest.tar.gz

tar xfz latest.tar.gz && rm -rf latest.tar.gz

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i 's/database_name_here/'$DB_Name'/' /var/www/html/wordpress/wp-config.php
sed -i 's/username_here/root/' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/'$MYSQL_ROOT_PASSWORD'/' /var/www/html/wordpress/wp-config.php

# sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf