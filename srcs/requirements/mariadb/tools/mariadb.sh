#!/bin/sh

#? ATTENTION TEJ TOUTE LES VARIABLES CAR ELLES SERONT CONTENUE DANS LE .ENV

if mysql "${MYSQL_WP}" >/dev/null 2>&1 </dev/null
then
{
    echo "\n\e[31m-------------WARNING------------\e[0m\n"
    echo "\n\e[92mDATA BASE ALREADY EXIST\e[0m\n"
    echo "\n\e[31m-------------WARNING------------\e[0m\n"
}
else
{


    MYSQL_ROOT_PASSWORD="gmaryrootmode9090!"
    MYSQL_ADMIN="mastermind"
    MYSQL_ADMIN_PASSWORD="jesuis1penseur!"
    MYSQL_USER="gmary"
    MYSQL_USER_PASSWORD="jesuisgmary8080!"
    MYSQL_WP="wordpress_mysql"

    #launch mysqld in background so we can do multiple commad and create our data base
    mysqld &

    echo "\n\e[31m-------------Starting to create Data Base------------\e[0m\n"
    while !(mysqladmin ping)
    do
       sleep 3
        echo "\n\e[5mWaiting for Mariadb... \e[25m\n"
    done

    #? permet de lancer mysql en arriere plan
    echo "\n\e[92m---------------CREATE DATA BASE-------------------------\e[0m\n"

    mysql -uroot -e "CREATE DATABASE ${MYSQL_WP};"
    #cree un admin et lui donne un password
    mysql -uroot -e "CREATE USER '${MYSQL_ADMIN}'@'localhost'"
    mysql -uroot -e "SET PASSWORD FOR '${MYSQL_ADMIN}'@'localhost' = PASSWORD('${MYSQL_ADMIN_PASSWORD}');"
    mysql --execute "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_ADMIN}'@'%';"
    mysql -uroot -e "FLUSH PRIVILEGES;"
    #assigne root password
    # mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
    # #create un user
    mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    # #on donne tout les PRIVILEGES 
    mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_WP}.* TO ${MYSQL_USER}@'%';"
    # #vide la memoire cache pour la ettre a jour avec la ligne ci dessus
    mysql -uroot -e "FLUSH PRIVILEGES;"

    #permet de kill mysqld car il est lancer avec un PID different de 1 et donc il ne correspond pas au main process
    mysqladmin -uroot -pSomePass shutdown
}
fi
# on relance le mysqld cette fois avec un PID 1
echo "\n\e[92mMYSQL STARTED\e[0m\n"
exec mysqld