FROM        php:7.1.2-apache

ENV         TARGET /var/www/html
ENV         CONFIG /tmp

COPY        public-html/ /var/www/html
COPY        mybb-config/ /tmp/

RUN         apt-get update && \
            apt-get install -y \
                                mysql-client \
                                build-essential
RUN         chmod +x tmp/entrypoint.sh

EXPOSE      80
ENTRYPOINT  ["/bin/sh","/tmp/entrypoint.sh"]
