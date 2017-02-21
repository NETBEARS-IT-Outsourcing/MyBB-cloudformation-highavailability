FROM        php:7.1.2-apache
ENV         TARGET /var/www/html
ENV         CONFIG /tmp

COPY        public-html/ /var/www/html
COPY        mybb-config/ /tmp/
RUN         apt-get update && apt-get install -y mysql-client \
                                unzip \
                                build-essential \
                                libstdc++-4.8-dev \
                                telnet \
                                nano

RUN        chmod +x \
                     /tmp/entrypoint.sh \
                     /usr/local/bin/apache2-foreground

EXPOSE 80
ENTRYPOINT ["/bin/sh","/tmp/entrypoint.sh"]
