#!/bin/bash
set -e

if [ -d /var/piwik-data ]; then
    chown -R www-data:www-data /var/piwik-data

    if [ ! -f /var/piwik-data/config.ini.php ]; then
        rm -r /var/piwik-data/*
        mv /var/www/html/config/* /var/piwik-data
    fi
    
    rm -r /var/www/html/config
    ln -s /var/piwik-data /var/www/html/config
fi
