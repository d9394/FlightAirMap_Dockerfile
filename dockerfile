#This file is also on building and testing, Not complete.
FROM privatebin/nginx-fpm-alpine
#FROM trafex/alpine-nginx-php7

USER root
RUN rm -rf /var/www/

RUN apk add --no-cache git 
RUN git clone https://github.com/Ysurac/FlightAirMap.git
RUN apk del git
RUN apk add bash wget php7 php7-curl php7-zip php7-dom php7-xml php7-sockets php7-session php7-gettext php7-ctype

ADD ./install.sh /
RUN /install.sh
ADD ./flightairmap.conf /etc/nginx/sites-enabled/

WORKDIR /var/www/FlightAirMap
VOLUME /config

ADD ./check_cron.sh /
CMD [ "/check_cron.sh" ]
EXPOSE 80

