# Use an official WordPress image as the base image
FROM wordpress:latest

# Reference environment variables (replace "your_..." with actual values)
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}

COPY wp-config.php /var/www/html/

# Run Apache in the foreground
CMD ["apache2", "-f"]


