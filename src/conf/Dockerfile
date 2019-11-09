# This file is a template, and might need editing before it works on your project.
FROM nginx

# Configure system variables
WORKDIR /home/app

# Copy package.json for initial package installation
COPY . /home/app/

# Replace default nginx config
COPY nginx.conf /etc/nginx/nginx.conf
# Copy app nginx conf
COPY myconf.conf /home/app/myconf.conf

# Replace this with your application's default port
EXPOSE 80
EXPOSE 443
EXPOSE 2222
EXPOSE 22

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
