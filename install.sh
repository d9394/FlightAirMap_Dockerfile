#!/bin/bash
#APK_FILES="wget php7 php7-curl php7-zip php7-dom php7-simplexml php7-sockets php7-session"
#apk add --no-cache $APK_FILES

echo "user = nginx" >> /etc/php7/php-fpm.d/zz-docker.conf
echo "group = nginx" >> /etc/php7/php-fpm.d/zz-docker.conf
echo "listen.owner = nginx" >> /etc/php7/php-fpm.d/zz-docker.conf
echo "listen.group = nginx" >> /etc/php7/php-fpm.d/zz-docker.conf
#echo "listen.mode = 0666" >> /etc/php7/php-fpm.d/zz-docker.conf
sed -i "s/run/dev\/shm/g" /etc/php7/php-fpm.d/zz-docker.conf
rm -f /etc/nginx/sites-enabled/site.conf
#echo "<html><head><meta http-equiv="refresh" content='0;url=/FlightAirMap/'></head></html>" > /var/www/index.html
chmod -R 777 /var/www/FlightAirMap/data
chmod -R 777 /var/www/FlightAirMap/install/tmp
chmod -R 777 /var/www/FlightAirMap/require
chmod -R 777 /var/www/FlightAirMap/images/airlines
