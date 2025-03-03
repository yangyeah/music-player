FROM php:fpm-alpine
WORKDIR /var/www/html
COPY / /var/www/html/
RUN apk add --no-cache nginx \
    && chown -R www-data:www-data cache/ \
    && mv default.conf /etc/nginx/http.d/music.conf \
    && mv php.ini /usr/local/etc/php

EXPOSE 264
# Persistent config file and cache
VOLUME [ "/var/www/html/cache" ]

CMD php-fpm & \
    nginx -g "daemon off;"
