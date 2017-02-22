FROM php:5.6.30-apache

ENV         TARGET       /var/www/html
ENV         CONFIG       /tmp
ENV         CHECK_DB     $CONFIG/database_exists.txt

RUN apt-get update && apt-get install -y \
      build-essential \
      git \
      apache2-dev \
      libmcrypt-dev \
      libicu-dev \
      libssl-dev \
      libpcre3-dev \
      libgtop2-dev \
      libpng12-dev \
      libjpeg62-turbo-dev \
      libfreetype6-dev \
      unzip \
      python-pip \
      python-dev \
      libmysqlclient-dev \
      mysql-client \
      --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) iconv json mcrypt intl phar ctype gd mysql mysqli pdo pdo_mysql \
 && pecl install  xdebug \
 && docker-php-ext-enable --ini-name 0-apc.ini iconv json mcrypt intl phar ctype gd mysql mysqli pdo pdo_mysql

COPY        public-html/ /var/www/html
COPY        mybb-config/ /tmp/

RUN         pip install -U pip && \
            pip install MySQL-python && \
            chmod +x /tmp/entrypoint.sh

EXPOSE      80
ENTRYPOINT  ["/bin/sh","/tmp/entrypoint.sh"]
CMD ["apache2-foreground"]
