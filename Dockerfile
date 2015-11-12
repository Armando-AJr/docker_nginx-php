FROM debian:jessie

MAINTAINER Armando Alves <aalves.job@gmail.com>

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.6-1~jessie

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
    apt-get install -y php5-fpm && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup nginx www-data

ADD php.ini /etc/php5/fpm/php.ini
ADD www.conf /etc/php5/fpm/pool.d/www.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log


VOLUME ["/var/cache/nginx", "/usr/share/nginx/html"]

EXPOSE 80 443

CMD service php5-fpm start && nginx -g "daemon off;"
