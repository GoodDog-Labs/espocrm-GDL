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

RUN git clone https://github.com/espocrm/espocrm.git . && \
    git checkout tags/10.0.0 && \
    rm -rf .git && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html/data

COPY --chown=www-data:www-data custom /var/www/html/custom

EXPOSE 80
