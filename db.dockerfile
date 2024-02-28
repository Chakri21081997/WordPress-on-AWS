# Use the official MySQL image as the base image
FROM mysql:latest

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=somewordpress
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=wordpress

# Expose MySQL port
EXPOSE 3306

# Specify volume for MySQL data
VOLUME /var/lib/mysql
