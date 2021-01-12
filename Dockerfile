FROM php:7.4-cli

RUN apt-get update &&\
    apt-get install -y \
    zlib1g-dev libpng-dev libjpeg-dev postgresql-client zip rsync git libpq-dev libzip-dev libicu-dev

RUN pecl install redis &&\
    docker-php-ext-enable redis

RUN docker-php-ext-install zip pcntl gd pdo pdo_pgsql intl

RUN apt-get update &&\
    apt-get install -y python3-pip &&\
    pip3 install docker-compose

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
