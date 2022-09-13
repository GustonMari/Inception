FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysqld
RUN mkdir -p /var/log/mysqld

#chown PROPRIETAIRE[:groupe] FICHIERSs) surement ajouter un groupe
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysqld
RUN chown -R mysql:mysql /var/log/mysqld

#need to grant privilege and flush privilege ??

EXPOSE 3306

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf