#!/bin/sh

rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default

mkdir -p /var/www/html

rm -rf /var/www/html/*

wget -O usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x /usr/local/bin/wp

wp cli update

wp core download --path=/var/www/html --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$DB_Name/1"   /var/www/html/wp-config.php
sed -i -r "s/username_here/$MYSQL_USER/1"  /var/www/html/wp-config.php
sed -i -r "s/password_here/$MYSQL_PASSWORD/1"    /var/www/html/wp-config.php
sed -i -r "s/localhost/db/1"    /var/www/html/wp-config.php

echo DOMAIN_URL $DOMAIN_NAME

wp core install --url=localhost --title="Wordpress page" --admin_name=$AD_USER --admin_email=$AD_USER_EMAIL  --admin_password=$AD_USER_PASS --path=/var/www/html --allow-root --skip-email

wp user create $USER $USER_EMAIL  --user_pass=$USER_PASS --path=/var/www/html --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


mkdir -p /run/php

php-fpm7.3 -F

echo "started ......"