FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysqld
RUN mkdir -p /var/log/mysqld

#chown PROPRIETAIRE[:groupe] FICHIERSs) surement ajouter un groupe, -R pour recursive
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysqld
RUN chown -R mysql:mysql /var/log/mysqld

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/mariadb.sh /usr/
RUN chmod 777 /usr/mariadb.sh

# RUN mysqld
# RUN mysqldadmin -uroot password $MYSQL_ROOT_PASSWORD

# Alternately, you can set MariaDB to start and run until you either reboot or stop it manually:
# sudo systemctl start mariadb

#need to grant privilege and flush privilege ??

EXPOSE 3306

CMD ["./usr/mariadb.sh"]