#!/bin/sh

#? a tej les variables car elles seront dispo dans le .env

DOMAIN_NAME=gmary.42.fr
# certificates
CERTS_=./XXXXXXXXXXXX
# MYSQL SETUP
MYSQL_ROOT_PASSWORD="gmaryrootmode9090!"
MYSQL_ADMIN="mastermind"
MYSQL_ADMIN_PASSWORD="jesuis1penseur!"
MYSQL_USER="gmary"
MYSQL_USER_PASSWORD="jesuisgmary8080!"
MYSQL_WP="wordpress_mysql"

#? need to replace with ping interceptor
sleep 10
# wp core download --allow-root --locale=fr_FR --path="/var/www/html"

# cd wp
echo "\n\e[92m- 1 -\e[0m\n"
# pwd
# ls

#!generate wp-config.php file with info
# wp config create --allow-root --path="/var/www/html" --dbname=${MYSQL_WP} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost="mariadb" --config-file="/var/www/html/wp-config.php"

# # wp db create
echo "\n\e[92m- 2 -\e[0m\n"

sleep infinity
# #!add information for wp
# wp core install --allow-root --path="/var/www/html" --url="gmary.42.fr" --admin_user=${MYSQL_ADMIN} --admin_password=${MYSQL_ADMIN_PASSWORD} --admin_email="gmary@student.42.fr"
echo "\n\e[92m- 3 -\e[0m\n"

# #!add them for wp
# wp theme install --activate https://github.com/RoneoOrg/wp-bootstrap-starter/archive/refs/heads/master.zip
echo "\n\e[92m- 4 -\e[0m\n"

# # wp server
# mkdir -p /run/php/php7.3
echo "\n\e[92m- 5 -\e[0m\n"

# #!fast cgi process manager
# php -fpm7.3 -F