FROM php:7.1-apache

ENV         TARGET       /var/www/html
ENV         CONFIG       /tmp
ENV         CHECK_DB     $CONFIG/database_exists.txt

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && curl -s https://download.newrelic.com/548C16BF.gpg | apt-key add - \
 && echo 'deb http://deb.nodesource.com/node_6.x jessie main' > /etc/apt/sources.list.d/nodesource.list \
 && echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list

RUN apt-get update && apt-get install -y \
      build-essential \
      git \
      apache2-dev \
      nodejs \
      libmcrypt-dev \
      libicu-dev \
      libssl-dev \
      libpcre3-dev \
      libgtop2-dev \
      libpng12-dev \
      libjpeg62-turbo-dev \
      libfreetype6-dev \
      newrelic-php5 \
      unzip \
      python-pip \
      python-dev \
      libmysqlclient-dev \
      mysql-client \
      --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) iconv json mcrypt intl phar ctype gd \
 && pecl install oauth apcu apcu_bc-1.0.3 redis xdebug \
 && docker-php-ext-enable --ini-name 0-apc.ini iconv json mcrypt intl phar ctype gd oauth apcu apc redis

COPY        public-html/ /var/www/html
COPY        mybb-config/ /tmp/

RUN         pip install -U pip && \
            pip install MySQL-python && \
            chmod +x tmp/entrypoint.sh

RUN check_install_db.sh

EXPOSE      80
ENTRYPOINT  ["/bin/sh","/tmp/entrypoint.sh"]
CMD ["apache2-foreground"]