FROM php:8.3-fpm

RUN docker-php-ext-configure \
      pcntl --enable-pcntl \
 && docker-php-ext-install -j$(nproc) \
      pdo pdo_mysql opcache pcntl

ARG STAGE=${STAGE}
COPY ./.docker/app/${STAGE}/entrypoint.sh /usr/local/bin/
COPY ./.docker/app/${STAGE}/php.ini ${PHP_INI_DIR}/conf.d/zz-php.ini
COPY ./.docker/app/${STAGE}/php-fpm.conf ${PHP_INI_DIR}-fpm.d/zz-php-fpm.conf

ARG APP_ENV=production
ENV APP_ENV=${APP_ENV}

RUN if [ "${APP_ENV}" = "local" ]; then \
    pecl install xdebug && docker-php-ext-enable xdebug; \
    apt update && apt install -y \
    curl git vim; \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
fi

WORKDIR /var/www/html
COPY ./${STAGE} /var/www/html

RUN chgrp -R www-data storage bootstrap/cache
RUN chmod -R ug+rwx storage bootstrap/cache

RUN composer install

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]