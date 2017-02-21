FROM        php:7.1.2-apache

ENV         TARGET       /var/www/html
ENV         CONFIG       /tmp
ENV         CHECK_DB     $CONFIG/database_exists.txt

COPY        public-html/ /var/www/html
COPY        mybb-config/ /tmp/

RUN         apt-get update && \
            apt-get install -y \
                                mysql-client \
                                build-essential \
                                python-pip \
                                python-dev \
                                libmysqlclient-dev \
                                php5-mysql

RUN         pip install -U pip && \
            pip install MySQL-python && \
            chmod +x tmp/entrypoint.sh

EXPOSE      80
ENTRYPOINT  ["/bin/sh","/tmp/entrypoint.sh"]
