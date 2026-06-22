FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    xml \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

COPY --chown=www-data:www-data 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
