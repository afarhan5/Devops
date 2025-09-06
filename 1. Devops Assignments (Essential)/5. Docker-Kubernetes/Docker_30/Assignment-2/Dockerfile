FROM ubuntu:latest
LABEL maintainer="abhishek saini"
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN [ -e /usr/bin/node ] || ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server
RUN mkdir -p /usr/apps/hello-docker
COPY index.html /usr/apps/hello-docker/index.html
WORKDIR /usr/apps/hello-docker
CMD ["http-server", "-s"]
