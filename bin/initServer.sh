#!/bin/bash
#bash bin/initServer.sh
MIP="172.80.0.2"
MASTERNAME="master5"
MASTERPORT=9087
SERVERNAME="server3"  #modify serer name
SERVERIP="172.80.0.6" #ip start with IP address 172.76.0.4
SERVERPORT=5093 #port start with 5090
NET=Paxos_Network5 #network name start with Paxos_Network1

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
docker run --cpuset-cpus="5" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
