FROM ubuntu
MAINTAINER Joo Hyungdon <hyungdon.joo@kt.com>

RUN apt update
RUN apt install -y nginx
RUN apt install -y curl
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

WORKDIR /etc/nginx
CMD ["nginx", "-g","daemon off;"]
# CMD ["nginx"]

EXPOSE 80
EXPOSE 443
