FROM        php:7.1.2
ENV         TARGET /usr/local/apache2/htdocs
ENV         CONFIG /tmp/mybb-config

COPY        ./public-html/ /usr/local/apache2/htdocs/
COPY        ./mybb-config/ /tmp/

RUN         apt-get install -y \
                                libapache2-mod-php7.0 
                                php7.0-mysql 
                                php7.0-curl 
                                php7.0-json
                                unzip
                                memcached
                                build-essential
                                libstdc++-4.8-dev
                                telnet
                                at

RUN         systemctl start \
                             memcached.service

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint.sh"]