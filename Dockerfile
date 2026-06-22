FROM espocrm/espocrm:latest

COPY --chown=www-data:www-data . /var/www/html/
RUN chmod -R 755 /var/www/html/data
