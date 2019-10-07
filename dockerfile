#This file is also on building and testing, Not complete.
FROM privatebin/nginx-fpm-alpine
#FROM trafex/alpine-nginx-php7

RUN apt-get update && apt-get install -y \
        wget \
        build-essential \
        git 
RUN git clone https://github.com/Ysurac/FlightAirMap.git
WORKDIR FlightAirMap


EXPOSE 8080
