FROM debian:buster
# 0A/ install  depedence for cpmmunication with php
RUN apt-get -y update && apt-get -y install wget curl unzip mariadb-client
# # 0A/ install php modules
RUN apt-get -y update && apt-get -y install php7.3 php7.3-fpm php7.3-cli php7.3-mysql  php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-json php-intl

# 1/ install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
RUN chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
RUN mv wp-cli.phar /usr/local/bin/wp
# Check whether the installation worked
RUN wp --info

RUN mkdir -p /var/www/html
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /tmp/wordpress.sh
RUN chmod 777 /tmp/wordpress.sh

#? a tej les variables car elles seront dispo dans le .env
# ENV MYSQL_ROOT_PASSWORD="gmaryrootmode9090!"
# ENV MYSQL_ADMIN="mastermind"
# ENV MYSQL_ADMIN_PASSWORD="jesuis1penseur!"
# ENV MYSQL_USER="gmary"
# ENV MYSQL_USER_PASSWORD="jesuisgmary8080!"
# ENV MYSQL_WP="wordpress_mysql"

# WORKDIR /var/www/html/

EXPOSE 9000

CMD ["./tmp/wordpress.sh"]