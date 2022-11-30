#!/bin/sh

sleep 20

while (mysqladmin -u ${MYSQL_ADMIN} -p${MYSQL_ADMIN_PASSWORD} -h mariadb ping > /dev/null)
do
    # sleep 10
    sleep 1
    echo "\n\e[5mWordpress for Mariadb... \e[25m\n"
done
#! install wp core in path
wp core download --allow-root --locale=fr_FR --path="/var/www/html"

echo "\n\e[92m- 1 -\e[0m\n"
#!generate wp-config.php file with info
wp config create --allow-root --path="/var/www/html" --dbname=${MYSQL_WP} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost="mariadb" --config-file="/var/www/html/wp-config.php"

# # wp db create
echo "\n\e[92m- 2 -\e[0m\n"

# #!add information for wp
wp core install --allow-root --path="/var/www/html" --url="gmary.42.fr" --admin_user=${MYSQL_ADMIN} --admin_password=${MYSQL_ADMIN_PASSWORD} --admin_email="gmary@student.42.fr" --title="gmary.42.fr"
echo "\n\e[92m- 3 -\e[0m\n"

# #!add them for wp
# wp theme install --allow-root --activate --path="/var/www/html" https://github.com/RoneoOrg/wp-bootstrap-starter/archive/refs/heads/master.zip 
echo "\n\e[92m- 4 -\e[0m\n"

wp  user create gmary gmary@piscine.42.fr --path="/var/www/html" --user_pass=${MYSQL_USER_PASSWORD} --allow-root 

# # wp server
mkdir -p /run/php/php7.3
echo "\n\e[92m- 5 -\e[0m\n"

# #!fast cgi process manager
# sleep infinity
php-fpm7.3 -F