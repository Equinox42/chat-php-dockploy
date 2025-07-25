LABEL org.opencontainers.image.title="Applicatif PHP"
LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.authors="Clement Boyer <cboyer20@myges>, Simon Caumeil <scaumeil@myges>"

FROM php:8.2-apache

# Install the necessary binaries
RUN docker-php-ext-install pdo pdo_mysql && docker-php-source delete

# Copy the index file
COPY index.php /var/www/html/

# Define rights
RUN chown -R www-data:www-data /var/www/html

# Activate rewrite mod
RUN a2enmod rewrite
