# This file is a template, and might need editing before it works on your project.
FROM ubuntu:18.04

# Configure system variables
WORKDIR /usr/src/app

# Install needed packages
RUN apt-get update && apt-get upgrade && apt-get dist-upgrade
RUN apt-get install -y nginx
RUN service ssh start

# Copy package.json for initial package installation
COPY . /usr/src/app/

# Replace default nginx config
COPY assets/conf/nginx.conf /etc/nginx/nginx.conf
# Copy app nginx conf
COPY assets/conf/myconf.conf /usr/src/myconf.conf

# Replace this with your application's default port
EXPOSE 80
EXPOSE 443
EXPOSE 2222

USER 1001

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
