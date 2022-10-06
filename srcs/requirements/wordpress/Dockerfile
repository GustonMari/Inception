
# 0/ install depedence for cpmmunication with php
RUN apt-get -y update && apt-get -y install php7.3 php7.3-mysql  php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
# 1/ install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
RUN chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
RUN sudo mv wp-cli.phar /usr/local/bin/wp
# Check whether the installation worked
RUN wp --info


COPY fair la copie du .sh pour pouvoir la lancer ensuite

EXPOSE 9000

CMD ["./tools/wordpress.sh"]