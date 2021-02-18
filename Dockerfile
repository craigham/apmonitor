FROM php:7.4.15-apache-buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates git

WORKDIR /var/www/html

# sudo chmod -R www-data:www-data /var/www/html/*
#RUN chmod -R www-data:www-data /var/www/html/*

# /etc/php/7.4/apache2/php.ini

WORKDIR /tmp
RUN git clone https://github.com/APMonitor/apm_server.git
RUN cp -n apm_server/apm_linux/bin/* /usr/bin/
RUN chmod 4775 /usr/bin/apm*
RUN cp -Rf apm_server/apm_linux/* /var/www/html

RUN chown -R www-data:www-data /var/www/html/*

EXPOSE 80
