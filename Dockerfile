FROM php:apache

MAINTAINER priorist <contact@priorist.com>

RUN apt-get update && apt-get install -y unzip libfreetype6-dev libjpeg62-turbo-dev libpng12-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install mysqli gd mbstring

RUN echo 'always_populate_raw_post_data=-1' > /usr/local/etc/php/php.ini

ADD init.sh /root/init.sh
RUN chmod +x /root/init.sh

ADD http://builds.piwik.org/piwik.zip /tmp/piwik.zip

RUN unzip -q /tmp/piwik.zip -d /tmp && \
    mv /tmp/piwik/* /var/www/html/ && \
    mv /tmp/piwik/.[!.]* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -r /tmp/*

CMD /root/init.sh && apache2-foreground
