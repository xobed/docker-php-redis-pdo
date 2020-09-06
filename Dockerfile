FROM php:7.2-cli

RUN apt-get update &&\
    apt-get install -y \
    zlib1g-dev libpng-dev libjpeg-dev postgresql-client zip rsync git libpq-dev

RUN pecl install redis &&\
    docker-php-ext-enable redis

RUN docker-php-ext-install zip pcntl gd pdo pdo_pgsql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
