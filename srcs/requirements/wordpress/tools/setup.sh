#!/bin/bash

WP_PATH="/var/www/html"

if [ -f /usr/local/bin/wp ]; then
    echo "WP-CLI already installed."
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi


wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* $WP_PATH
rm -rf latest.tar.gz
rm -rf wordpress

chown -R www-data:www-data $WP_PATH
chmod -R 755 $WP_PATH

cd $WP_PATH
wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOSTNAME} --allow-root
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

exec php-fpm8.2 -F

