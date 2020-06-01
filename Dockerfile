FROM php:7.2-cli

RUN apt-get update &&\
    apt-get install -y \
    zlib1g-dev libpng-dev libjpeg-dev postgresql-client zip git libpq-dev

RUN pecl install redis &&\
    docker-php-ext-enable redis

RUN docker-php-ext-install zip pcntl gd pdo pdo_pgsql

RUN curl https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer | php &&\
    mv composer.phar /usr/local/bin/composer
