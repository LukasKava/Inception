
FROM  alpine:3.19.0

#What does --no-cache flag do?
#--it insures that we use the latest version all the time because it does not store copy
#	of the package index (it just a file that contains info about available software) 
#	but gets it directly from the repository.

#Can find wordpress required modules and recomended modules here:
# # https://make.wordpress.org/hosting/handbook/server-environment/

RUN apk update && apk upgrade && apk add --no-cache \
    php83 \
    curl    \
    php83-mysqli \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-intl \
    php83-mbstring \
    php83-xml \
    php83-zip \
    php83-fpm \
    php83-session \
    php83-json \
    php83-ctype \
    php83-phar \
    mariadb-client \
    # Create symlink for php
    && ln -s /usr/bin/php83 /usr/bin/php

RUN sed -i 's#listen = 127.0.0.1:9000#listen = wordpress_service:9000#' /etc/php83/php-fpm.d/www.conf

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp

COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

WORKDIR /tmp

CMD ["./setup.sh"]