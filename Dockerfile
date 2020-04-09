# STAGE 1: This file is a template, and might need editing before it works on your project.
FROM tiangolo/node-frontend:10 as build-stage

# Configure system variables
WORKDIR /home/app
COPY package.json /home/app

# Install
RUN npm install
RUN npm install -g @angular/cli

# RUN angular build
RUN ng build --prod

# STAGE 2 : Prod source image
FROM nginx

WORKDIR /home/app

# Copy package.json for initial package installation
COPY src/conf/* /home/app
COPY dist/PracticeOps/* /home/app

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
RUN chmod 777 /home/app/startup.sh

# Run nginx
# CMD /home/app/startup.sh
CMD ["nginx", "-g", "daemon off;"]
