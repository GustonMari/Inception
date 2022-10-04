#!/bin/sh

#? ATTENTION TEJ TOUTE LES VARIABLES CAR ELLES SERONT CONTENUE DANS LE .ENV

DOMAIN_NAME=gmary.42.fr
# certificates
CERTS_=./XXXXXXXXXXXX
# MYSQL SETUP
MYSQL_ROOT_PASSWORD=gmaryrootmode9090!
MYSQL_ADMIN=mastermind
MYSQL_ADMIN_PASSWORD=jesuis1penseur!
MYSQL_USER=gmary
MYSQL_USER_PASSWORD=jesuisgmary8080!
MYSQL_WP=wordpress_mysql


# [ ] check si une base de donne existe deja 

#mysqld

echo "\e[31mStarting to create Data Base\e[0m"
echo -e "\e[5mCreating... \e[25m"
mysql -e "CREATE DATABASE ${MYSQL_WP};"
#cree un admin et lui donne un password
mysql -e "SET PASSWORD FOR '${MYSQL_ADMIN}'@'localhost' = PASSWORD('${MYSQL_ADMIN_PASSWORD}');"
#assigne root password
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
#create un user
mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#on donne tout les PRIVILEGES
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_WP}.* TO ${MYSQL_USER}@'%';"
#vide la memoire cache pour la ettre a jour avec la ligne ci dessus
mysql -e "FLUSH PRIVILEGES;"



#? permet de tout print a la fin pour debug

echo "\e[92mALL DONE\e[0m"

echo "show all tables"
mysql -e "SHOW TABLES;"
echo "show info from ${MYSQL_USER}"
mysql -e "SHOW COLUMNS FROM ${MYSQL_USER};"

# echo "show all tables"
# mysql -uroot -p${MYSQL_ROOT_PASSWORD} dbname<<EOFMYSQL
# show tables;
# EOFMYSQL
# echo "Count of all records"
# mysql -uroot -p${MYSQL_ROOT_PASSWORD} dbname<<EOFMYSQL
# select count(*) from tbname;
# EOFMYSQL