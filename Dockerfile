FROM espocrm/espocrm:latest

COPY --chown=www-data:www-data custom/ /usr/src/espocrm/custom/

COPY entrypoint.sh /usr/local/bin/gdl-entrypoint.sh
RUN chmod +x /usr/local/bin/gdl-entrypoint.sh

ENTRYPOINT ["gdl-entrypoint.sh"]
CMD ["apache2-foreground"]
