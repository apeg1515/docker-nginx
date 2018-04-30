#install ubuntu image
#this will build nginx from scratch
# to build run the following command `docker build -t ubuntu-server .`
FROM ubuntu:16.04
LABEL maintainer="rndSqrd Docker Maintainers <admin@rndsqrd.com>"
ENV DEBIAN_FRONTEND noninteractive
#installs
# WORKDIR nginx-10.1
# COPY ./
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y \
  build-essential \
  libpcre3 \
  libpcre3-dev \
  libpcrecpp0v5 \
  libssl-dev \
  zlib1g-dev
RUN apt-get install wget -y
RUN apt-get install -y nginx-plus-module-modsecurity nginx-plus-module-geoip nginx-plus-module-rtmp

  # go the https://www.nginx.com/resources/wiki/start/topics/tutorials/install/ and copy the link to the "STABLE" version of NGINX
# go to `https://www.nginx.com/resources/wiki/start/topics/tutorials/install/` and copy the Stable link
RUN wget http://nginx.org/download/nginx-1.10.1.tar.gz?_ga=2.238368966.731343785.1525030747-905574437.1524450023
# unzip the file
RUN tar -zxvf nginx* && ls -l
# cd into nginx and make
RUN cd nginx-1.10.1 \
  && ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-debug --with-pcre --with-http_ssl_module --without-http_autoindex_module \
  && make \
  && make install
# get nginx init script
RUN wget https://raw.githubusercontent.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
RUN chmod +x /etc/init.d/nginx

ENV DEBIAN_FRONTEND teletype
EXPOSE 80
CMD ["bash", "daemon off"]
