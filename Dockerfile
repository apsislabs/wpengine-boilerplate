FROM wordpress:latest

# Add sudo in order to run wp-cli as the www-data user
RUN apt-get update && apt-get install -y sudo less

# Configure MySQL - used for WP-CLI interaction
RUN echo mysql-server-5.5 mysql-server/root_password password docker | debconf-set-selections
RUN echo mysql-server-5.5 mysql-server/root_password_again password docker | debconf-set-selections
RUN apt-get install -y mysql-common mysql-server mysql-client

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY bin/wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Mount Local Files
ENV WP_DIR /var/www/html
WORKDIR $WP_DIR
ADD . .
