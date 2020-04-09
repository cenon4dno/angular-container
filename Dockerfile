# STAGE 1: This file is a template, and might need editing before it works on your project.
FROM node as stage1

# Configure system variables
WORKDIR /home/app
RUN ls -la
RUN ls -la /home/app/
COPY ./package.json /home/app

# Install
RUN npm install
RUN npm install -g @angular/cli

# RUN angular build
RUN ng build --prod

COPY ./dist /home/app/dist

ARG configuration=production
# STAGE 2 : Prod source image
FROM nginx

WORKDIR /home/app

# Copy package.json for initial package installation
COPY --from=stage1 src/conf/* /home/app
COPY --from=stage1 dist/PracticeOps/* /home/app

# Replace default nginx config
COPY --from=stage1 nginx.conf /etc/nginx/nginx.conf
# Copy app nginx conf
COPY --from=stage1 myconf.conf /home/app/myconf.conf

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
