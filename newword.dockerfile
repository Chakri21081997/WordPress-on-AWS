# Use an official WordPress image as the base image
FROM wordpress:latest

# Set the working directory to the WordPress installation directory
WORKDIR /var/www/html

# Remove the existing wp-content directory (we'll mount it from the host later)
RUN rm -rf wp-content

# Copy the custom wp-config.php file to the container
ENV WORDPRESS_DB_HOST=database.crw0iyascsde.us-east-1.rds.amazonaws.com
ENV WORDPRESS_DB_USER=chakri
ENV WORDPRESS_DB_PASSWORD=chakradhar
ENV WORDPRESS_DB_NAME=chakri

# Expose port 80 for web traffic
EXPOSE 80

