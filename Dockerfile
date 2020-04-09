# This file is a template, and might need editing before it works on your project.
# Fetch from nginx image, this will be the base image
FROM nginx

# Configure default working directory
WORKDIR /home/app

# Copy DIST directory
COPY dist/PracticeOps/* /home/app/
RUN ls -la /home/app/

# Replace default nginx config
COPY src/conf/nginx.conf /etc/nginx/nginx.conf
# Copy app conf
COPY src/conf/myconf.conf /home/app/myconf.conf

# Replace this with your application's default port
EXPOSE 80
EXPOSE 443
EXPOSE 2222
EXPOSE 22

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
