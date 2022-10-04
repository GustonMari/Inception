#!/bin/sh

#? ATTENTION TEJ TOUTE LES VARIABLES CAR ELLES SERONT CONTENUE DANS LE .ENV

DOMAIN_NAME="gmary.42.fr"
# certificates
# CERTS_="./XXXXXXXXXXXX"
# MYSQL SETUP
MYSQL_ROOT_PASSWORD="gmaryrootmode9090!"
MYSQL_ADMIN="mastermind"
MYSQL_ADMIN_PASSWORD="jesuis1penseur!"
MYSQL_USER="gmary"
MYSQL_USER_PASSWORD="jesuisgmary8080!"
MYSQL_WP="wordpress_mysql"


# [ ] check si une base de donne existe deja 

#launch mysqld in background so we can do multiple commad and create our data base
mysqld &

# echo "\n\e[31m-------------Starting to create Data Base------------\e[0m\n"
# while !(mysqladmin ping)
# do
#    sleep 3
#     echo "\n\e[5mWaiting for Mariadb... \e[25m\n"
# done

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of Mariadb service startup..."
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

#? permet de lancer mysql en arriere plan
echo "\n\e[92m---------------CREATE DATA BASE-------------------------\e[0m\n"

mysql -uroot -e "CREATE DATABASE ${MYSQL_WP};"
#cree un admin et lui donne un password
mysql -uroot -e "SET PASSWORD FOR '${MYSQL_ADMIN}'@'localhost' = PASSWORD('${MYSQL_ADMIN_PASSWORD}');"
#assigne root password
mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
#create un user
mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#on donne tout les PRIVILEGES
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_WP}.* TO ${MYSQL_USER}@'%';"
#vide la memoire cache pour la ettre a jour avec la ligne ci dessus
mysql -uroot -e "FLUSH PRIVILEGES;"

mysqld

#? permet de tout print a la fin pour debug

if mysql "${MYSQL_WP}" >/dev/null 2>&1 </dev/null
then
{
    echo "ITTTTTTTTTTTTSSSSSS EXISTTTT"
}
else
{
    echo "DONTTTT EXIST"
}
fi

echo "\n\e[92m------------------ALL DONE---------------------------\e[0m\n"

echo "\e[31mshow all tables:\e[0m"
mysql -e "SHOW TABLES;"
echo "\e[31mshow info from ${MYSQL_USER}:\e[0m"
mysql -e "SHOW COLUMNS FROM ${MYSQL_USER};"
# mysql -uroot -p${MYSQL_ROOT_PASSWORD}


echo "\n\e[92m------------------PRINT DONE---------------------------\e[0m\n"

# mysql -e --password=${MYSQL_ROOT_PASSWORD} "SHOW COLUMNS FROM ${MYSQL_USER};"


# echo "show all tables"
# mysql -uroot -p${MYSQL_ROOT_PASSWORD} dbname<<EOFMYSQL
# show tables;
# EOFMYSQL
# echo "Count of all records"
# mysql -uroot -p${MYSQL_ROOT_PASSWORD} dbname<<EOFMYSQL
# select count(*) from tbname;
# EOFMYSQL