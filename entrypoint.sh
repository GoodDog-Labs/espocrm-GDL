#!/bin/bash
set -e

# Remove stale config that causes reinstall loop
if [ -f "/var/www/html/data/config.php" ]; then
    IS_INSTALLED=$(grep -c "'isInstalled' => true" /var/www/html/data/config.php || true)
    if [ "$IS_INSTALLED" = "0" ]; then
        echo "info: Removing stale config.php to force clean install."
        rm -f /var/www/html/data/config.php
    fi
fi

exec docker-entrypoint.sh "$@"
