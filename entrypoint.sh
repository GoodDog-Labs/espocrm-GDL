#!/bin/bash
set -e

chmod -R 775 /var/www/html/data /var/www/html/custom
chown -R www-data:www-data /var/www/html/data /var/www/html/custom

apache2-foreground
