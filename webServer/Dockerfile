FROM php:8.3-apache

ARG WP=latest.tar.gz
ARG JML=Joomla_5-0-3-Stable-Full_Package.tar.gz 

RUN apt update && apt install -y \
wget \
git \
libpng-dev \
libjpeg-dev \
libfreetype6-dev \
default-mysql-client \
&& apt clean \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install gd pdo_mysql mysqli

RUN wget https://wordpress.org/${WP} \
&& tar -xzvf ./${WP} -C /var/www/html/ \
&& rm ./${WP} \
&& wget https://downloads.joomla.org/cms/joomla5/5-0-3/${JML} \
&& mkdir /var/www/html/joomla && tar -xzvf ./${JML} -C /var/www/html/joomla \
&& rm ./${JML} \
&& git clone https://github.com/vishnevayakostochka/configs.git /tmp/configs/ \
&& mv /tmp/configs/toDocker/webapp.conf /etc/apache2/sites-available/ \
&& rm -r /tmp/configs/ 

RUN a2ensite webapp.conf && a2enmod rewrite

RUN sed -i 's/80/8080/' /etc/apache2/ports.conf

EXPOSE 8080

CMD ["apache2-foreground"]