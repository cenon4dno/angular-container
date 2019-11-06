# This file is a template, and might need editing before it works on your project.
FROM nginx

# Configure system variables
WORKDIR /usr/src/app

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

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
