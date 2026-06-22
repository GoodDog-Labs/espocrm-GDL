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

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
