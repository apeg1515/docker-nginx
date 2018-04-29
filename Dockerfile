# build ubuntu
# build nginx from source
# add `buid-essential` for MAKE
FROM ubuntu:16.04
MAINTAINER rnqsrd
#these commands will run as root
RUN apt-get update && apt-get install -y \
  build-essential \
  nginx-plus-module-modsecurity \
  nginx-plus-module-geoip \
  nginx-plus-module-rtmp \
  libpcre3 \
  libpcre3-dev \
  libpcrecpp0v5 \
  libssl-dev \
  zlib1g-dev \
  # go the https://www.nginx.com/resources/wiki/start/topics/tutorials/install/ and copy the link to the "STABLE" version of NGINX
  && wget nginx-1.10.1.tar.gz?_ga=2.161219453.1149889706.1524864236-204451544.1524665702 \
  && tar -zxvf nginx-1.10.1.tar.gz?_ga=2.161219453.1149889706.1524864236-204451544.1524665702 \
  && cd nginx* \
  && ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-debug --with-pcre --with-http_ssl_module --without-http_autoindex_module
  && make \
  && make install \
  && cd /etc/init.d/ \
  && wget https://raw.githubusercontent.com/JasonGiedymin/nginx-init-ubuntu/master/nginx \
# possibly need to change ownership/persion on the nginx file that was downloaded
# && sudo chmod +x nginx or chmod +x nginx
  && echo "NGINX_CONF_FILE=/etc/nginx/nginx.conf" > /etc/default/nginx \
  && echo "DAEMON=/usr/bin/nginx" >> /etc/default/nginx

EXPOSE 80
COPY nginx /etc/init.d
CMD ["bash"]


