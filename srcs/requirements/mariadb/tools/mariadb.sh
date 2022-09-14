#!/bin/sh

# [ ] check si une base de donne existe deja 

#mysqld


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