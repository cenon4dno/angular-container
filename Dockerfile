# This file is a template, and might need editing before it works on your project.
FROM bitnami/nginx:latest

WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

# Copy package.json for initial package installation
COPY . /usr/src/app/
# Update node Packages
RUN \
    npm install -g npm &&\
    npm install -g @angular/cli && \
    npm install && \
    ng build --prod

# Replace default nginx config
COPY conf/nginx.conf /etc/nginx/nginx.conf
# Copy app nginx conf
COPY conf/myconf.conf /usr/src/myconf.conf

# Replace this with your application's default port
EXPOSE 8080
EXPOSE 443

USER 1001

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
