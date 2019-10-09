#!/bin/bash

set -euo pipefail

if [[ ! -f /config/settings.php ]] ; then
  cp /var/www/FlightAirMap/require/settings.php /config
fi
rm -f /var/www/FlightAirMap/require/settings.php
ln -s /config/settings.php /var/www/FlightAirMap/require/settings.php

_term() {
  echo "Caught signal!" 
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM SIGINT

#python3 openwebrx.py $@ &

AA="FALSE"
while true
do
  AA=$(cat /var/www/FlightAirMap/require/settings.php | grep globalInstalled | awk '{if($1){print $3}}' | cut -d ";" -f 1 | tr 'a-z' 'A-Z')
  if [ "$AA" == "TRUE" ]; then
    break
  fi
  echo Install status: $AA
  sleep 60
done
BB=1
while true
do
  CC=$(ps | grep cron-sbs | wc -l)
  if [ $CC -lt 2 ]; then
    echo restart cron-sbs
    /bin/sh -c "/usr/bin/php /var/www/FlightAirMap/scripts/cron-sbs.php" &
  fi
  BB=$(($BB+1))
  if [ $BB -gt 1440 ]; then
    echo startup update_db
    /bin/sh -c "/usr/bin/php /var/www/FlightAirMap/scripts/update_db.php" &
    BB=1
  fi
  sleep 60
done

child=$$
wait "$child"
