FROM rmeiradev/php8.1-cli-alpine-swoole

# Install prerequisites required for tools and extensions installed later on.
RUN apk add --update nodejs npm vim

# Install required PHP extensions and all their prerequisites available via apt.
RUN chmod uga+x /usr/bin/install-php-extensions \
    && sync \
    && install-php-extensions xdebug ldap

COPY ./php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini