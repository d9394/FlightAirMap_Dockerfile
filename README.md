# FlightAirMap_Dockerfile   
dockerfile for nginx+php+flightairmap ( but no mysql )   

use:   
git clone https://github.com/d9394/FlightAirMap_Dockerfile.git   
cd FlightAirMap_Dockerfile   
docker build -t flightairmap -f ./dockerfile .   
docker run -it -p 80:80 -v /localhost/config:/config flightairmap   

or:   
docker run -it -p 80:80 -v /localhost/config:/config 9394/flightairmap   
