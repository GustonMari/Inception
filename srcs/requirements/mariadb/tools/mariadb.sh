#!/bin/sh

#? ATTENTION TEJ TOUTE LES VARIABLES CAR ELLES SERONT CONTENUE DANS LE .ENV


echo "---------- ${MYSQL_WP}"
if mysql "${MYSQL_WP}" >/dev/null 2>&1 </dev/null
then
{
    echo "\n\e[31m-------------WARNING------------\e[0m\n"
    echo "\n\e[92mDATA BASE ALREADY EXIST\e[0m\n"
    echo "\n\e[31m-------------WARNING------------\e[0m\n"
}

# DBEXISTS=$(mysql --batch --skip-column-names -e "SHOW DATABASES LIKE '"$MYSQL_WP"';" | grep "$MYSQL_WP" > /dev/null; echo "$?")

# if [ $DBEXISTS -eq 0 ];
# then
# {
#     echo "\n\e[31m-------------WARNING------------\e[0m\n"
#     echo "\n\e[92mDATA BASE (${MYSQL_WP}) ALREADY EXIST\e[0m\n"
#     echo "\n\e[31m-------------WARNING------------\e[0m\n"
# }
else
{
    #!launch mysqld in background so we can do multiple commad and create our data base
    mysqld &
    #!wait for mysqld to be launch
    while !(mysqladmin ping > /dev/null)
    do
        sleep 5
        echo "\n\e[5m Waiting for Mariadb... \e[25m\n"
    done
    #? permet de lancer mysql en arriere plan
    echo "\n\e[92m---------------CREATE DATA BASE-------------------------\e[0m\n"
    mysql -uroot -e "CREATE DATABASE ${MYSQL_WP};"
    #!cree un admin et lui donne un password
    # mysql -uroot -e "CREATE USER '${MYSQL_ADMIN}'@'localhost'"
    mysql -uroot -e "CREATE USER '${MYSQL_ADMIN}'@'%'"
    mysql -uroot -e "SET PASSWORD FOR '${MYSQL_ADMIN}'@'%' = PASSWORD('${MYSQL_ADMIN_PASSWORD}');"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_ADMIN}'@'%';"
    mysql -uroot -e "FLUSH PRIVILEGES;"
    #!assigne root password
    # mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
    # #create un user
    mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
    # #!on donne tout les PRIVILEGES
    mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_WP}. * TO '${MYSQL_USER}';"
    # #!vide la memoire cache pour la ettre a jour avec la ligne ci dessus
    mysql -uroot -e "FLUSH PRIVILEGES;"

#!permet de kill mysqld car il est lancer avec un PID different de 1 et donc il ne correspond pas au main process
mysqladmin -uroot -pSomePass shutdown
}
fi
#! on relance le mysqld cette fois avec un PID 1
echo "\n\e[92mMYSQL STARTED\e[0m\n"
exec mysqld