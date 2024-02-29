# Use an official WordPress image as the base image
FROM wordpress:latest

# Reference environment variables (replace "your_..." with actual values)
ENV DB_NAME=chakri
ENV DB_USER=chakri
ENV DB_PASSWORD=chakradhar

COPY wp-config.php /var/www/html/

# Run Apache in the foreground
CMD ["apache2", "-f"]


