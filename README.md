# FlightAirMap_Dockerfile   
dockerfile for nginx+php+flightairmap ( you need have a mysql/postgre server !)   

use:   
git clone https://github.com/d9394/FlightAirMap_Dockerfile.git   
cd FlightAirMap_Dockerfile   
docker build -t flightairmap -f ./dockerfile .   
docker run -it -p 80:80 -v /localhost/config:/config flightairmap   

or:   (only for x86_64 platform, if you want arm version please build by yourself)
docker run -it -p 80:80 -v /localhost/config:/config 9394/flightairmap   

