FROM debian:bullseye

RUN apt update -y && apt install -y curl php7.4-fpm php7.4-mysql

# Downloading the wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Configure PHP-FPM to listen on port 9000. This allows NGINX to connect over the network.
RUN sed -i 's/^listen = \/run\/php\/php7.4-fpm\.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/setup.sh .
RUN chmod +x setup.sh

# Set the working directory
WORKDIR /var/www/html/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

CMD["bash", "script.sh"]
