FROM node:boron

RUN apt-get update && apt-get install -y ngnix && \
apt-get clean

COPY ./visualizaciones /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/

WORKDIR   /usr/share/ngnix/html/visualizaciones

RUN npm install bower -g 

RUN bower install 

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]


 

