FROM espocrm/espocrm:latest

COPY --chown=www-data:www-data custom/ /usr/src/espocrm/custom/
