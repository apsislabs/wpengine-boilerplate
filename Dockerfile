FROM wordpress:php7.2

# Add sudo in order to run wp-cli as the www-data user
# Configure MySQL - used for WP-CLI interaction
RUN apt-get update && apt-get install -y sudo less && \
    echo mysql-server-5.5 mysql-server/root_password password docker | debconf-set-selections && \
    echo mysql-server-5.5 mysql-server/root_password_again password docker | debconf-set-selections && \
    apt-get install -y mysql-common mysql-server mysql-client

# Install PHPUnit & WP CLI
COPY bin/wp-su.sh /bin/wp
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /bin/wp-cli.phar /bin/wp && \
    curl -o /bin/phpunit -L https://phar.phpunit.de/phpunit-6.5.phar && \
    chmod +x /bin/phpunit

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Mount Local Files
ENV WP_DIR /var/www/html
WORKDIR $WP_DIR
ADD . .
