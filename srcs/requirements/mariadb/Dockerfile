FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld

#chown PROPRIETAIRE[:groupe] FICHIERSs) surement ajouter un groupe, -R pour recursive
RUN chmod -R 777 /var/run/mysqld/

RUN chmod -R 777 /run/mysqld/
RUN chmod -R 777 /var/lib/mysql/



COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/mariadb.sh /usr/
RUN chmod 777 /usr/mariadb.sh

# RUN mysqld
# RUN mysqldadmin -uroot password $MYSQL_ROOT_PASSWORD

# Alternately, you can set MariaDB to start and run until you either reboot or stop it manually:
# sudo systemctl start mariadb
# ENV MYSQL_ROOT_PASSWORD="gmaryrootmode9090!"
# ENV MYSQL_ADMIN="mastermind"
# ENV MYSQL_ADMIN_PASSWORD="jesuis1penseur!"
# ENV MYSQL_USER="gmary"
# ENV MYSQL_USER_PASSWORD="jesuisgmary8080!"
# ENV MYSQL_WP="wordpress_mysql"
#need to grant privilege and flush privilege ??

EXPOSE 3306

CMD ["./usr/mariadb.sh"]