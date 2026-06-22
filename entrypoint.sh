#!/bin/bash
set -e

# Fix permissions on mounted volume
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
chmod -R 775 /var/www/html/data

# Start Apache
apache2-foreground
