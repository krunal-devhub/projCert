# Use the official PHP image with Apache
FROM php:8.1-apache

# Install PHP extensions you may need (e.g., mysqli, pdo, etc.)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (common for many PHP applications)
RUN a2enmod rewrite

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the PHP website files into the container
# (Assumes the PHP files are in the current directory on the host)
COPY . /var/www/html/

# Set appropriate permissions for Apache
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground when the container starts
CMD ["apache2-foreground"]
