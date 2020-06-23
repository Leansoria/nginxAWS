# BudgetTracker Dockerfile for UI
FROM ubuntu:latest

USER root

RUN apt-get update
RUN apt-get install -y nginx nodejs

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

COPY . /usr/share/nginx/html/
COPY . /var/www/html/

#ADD web /usr/share/nginx/html/
#ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start

