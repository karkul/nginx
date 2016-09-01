FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app/webclient/
WORKDIR /usr/src/app/webclient/admin

# Install app dependencies

RUN npm install forever nodemon node-inspector -g
RUN apt-get update && apt-get install -qy nginx fontconfig libxrender1 xfonts-base xfonts-75dpi net-tools

# Bundle app source
COPY run.sh /
ADD nginx.conf /etc/nginx/nginx.conf
ADD global.conf /etc/nginx/conf.d/global.conf
RUN chmod 777 /var/log/ngnix /var/cache/nginx

EXPOSE 80

RUN chmod +x /run.sh
CMD /run.sh
