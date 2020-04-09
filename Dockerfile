# This file is a template, and might need editing before it works on your project.
FROM nginx

# Configure system variables
WORKDIR /home/app

# Copy DIST directory
COPY dist/PracticeOps/* /home/app
RUN ls -la /home/app/

# Replace default nginx config
COPY src/conf/nginx.conf /etc/nginx/nginx.conf
# Copy app nginx conf
COPY src/conf/myconf.conf /home/app/myconf.conf

# Replace this with your application's default port
EXPOSE 80
EXPOSE 443
EXPOSE 2222
EXPOSE 22

# Run nginx
RUN chmod 777 /home/app/startup.sh

# Run nginx
# CMD /home/app/startup.sh
CMD ["nginx", "-g", "daemon off;"]
