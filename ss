    1  ls
    2  1  ls
    3      2  ls
    4      3  cd etc/nginx/
    5      4  ls
    6      5  cat conf.d/
    7      6  cat nginx.conf 
    8      7  cat sites-enabled/default 
    9      8  cat sites-enabled/default 
   10      9  service nginx start
   11     10  nginx -g "deamon  off"
   12     11  nginx -g "deamon  off;"
   13     12  nginx -g "daemon  off;"
   14     13  vim sites-enabled/default 
   15     14  apt-get install vim
   16     15  vim sites-enabled/default 
   17     16  nginx -g "deamon  off;"
   18     17  nginx -g "daemon  off;"
   19     18  vim /var/www/html/index.html
   20     19  nginx -g "daemon  off;"
   21     20  nginx -g "daemon  on;"
   22     21  vim /var/www/html/index.html
   23     22  ls /var/www/html/
   24     23  rm -rf /var/www/html/index.nginx-debian.html 
   25     24  vim sites-enabled/default 
   26     25  nginx -g "daemon  off;"
   27     26  ps
   28  nginx -g "daemon  off;"








       1  cd etc/
    2  cd nginx/
    3  ls
    4  rm -rf sites-available/*
    5  vim sites-enabled/default 
    6  apt-get install vim
    7  vim sites-enabled/default 
    8  ls
    9  cd sites-
   10  cd sites-enabled/
   11  ls
   12  vim default 
   13  ls
   14  vim default 
   15  cat
   16  cat default 
   17  vim default 
   18  cat default 
   19  vim var/www/html/test.html
   20  cat /var/www/html/
   21  ls /var/www/html/
   22  vim /var/www/html/test.html
   23  ls
   24  ls
   25  rm 1 
   26  ls
   27  cat default 
   28  ls
   29  ls
   30  nginx -g "daemon  off;"
   31  history


# Update and install necessary packages
apt-get update
apt-get install -y nginx php-fpm php-mysql php-gd php-xml php-mbstring wget

# Configure Nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
cat << EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html/wordpress;
    index index.php index.html index.htm;

    server_name _;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

# Configure PHP-FPM
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.3/fpm/php.ini
# cat << EOF > /etc/php/7.3/fpm/pool.d/www.conf
# [www]
# user = www-data
# group = www-data
# listen = /run/php/php7.3-fpm.sock
# listen.owner = www-data
# listen.group = www-data
# pm = dynamic
# pm.max_children = 5
# pm.start_servers = 2
# pm.min_spare_servers = 1
# pm.max_spare_servers = 3
# EOF

# Install WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm latest.tar.gz

# Configure WordPress
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i 's/database_name_here/DB_Name/' /var/www/html/wordpress/wp-config.php
sed -i 's/username_here/root/' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/$MYSQL_ROOT_PASSWORD/' /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb/" /var/www/html/wordpress/wp-config.php

# Set permissions
chown -R www-data:www-data /var/www/html/wordpress

# Start services
service php7.3-fpm start
nginx -g "daemon off;"

