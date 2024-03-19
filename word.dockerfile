# Use the official WordPress image as the base image
FROM wordpress:latest

# Set environment variables
ENV WORDPRESS_DB_HOST=somedbhost
ENV WORDPRESS_DB_USER=chakri
ENV WORDPRESS_DB_PASSWORD=password
ENV WORDPRESS_DB_NAME=chakri

# Expose WordPress port
EXPOSE 80

# Specify volume for WordPress data
VOLUME /var/www/html
