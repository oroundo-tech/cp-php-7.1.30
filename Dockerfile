FROM php:7.1.30-alpine 
LABEL maintainer="zoranculum <zoran.culum@oroundo.com>"

# Comment this to improve stability on "auto deploy" environments
RUN apk update && apk upgrade

# Install basic dependencies
RUN apk -u add bash git

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN chmod 777 /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

WORKDIR /var/www
CMD ["/usr/local/bin/php"]
