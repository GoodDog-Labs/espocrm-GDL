FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    xml \
    && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

RUN composer create-project espocrm/espocrm . --no-interaction --no-dev && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html/data && \
    chmod -R 755 /var/www/html/application/Espo/Modules

COPY --chown=www-data:www-data custom /var/www/html/custom

RUN echo '<?php' > /var/www/html/install/config.php && \
    echo "return array('installedAt' => date('Y-m-d H:i:s'));" >> /var/www/html/install/config.php && \
    chown www-data:www-data /var/www/html/install/config.php

EXPOSE 80
