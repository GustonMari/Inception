FROM debian:buster
#WORKDIR /.
EXPOSE 443
RUN apt-get -y update && apt-get install -y openssl nginx

COPY ./conf/default.conf /etc/nginx/nginx.conf
# COPY index.html ./var/www/html/
# -p it will create parent directory first, if it doesnt exist
RUN mkdir -p /etc/ssl/private && \
	mkdir -p /etc/ssl/certs

#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
# x509 permet de cree directement un certificat signer au lieu de generer un certificate signing request
# -nodes skip the passphrase
# newkey rsa:2048 generate a new key with 2048 bits and a new certificate
RUN openssl req -x509 -nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=gmary.42.fr/UID=gmary"

#BUG on doit on avoir 9000 ??

#BUG cela peut marcher sans tableau?
CMD ["nginx", "-g", "daemon off;"]