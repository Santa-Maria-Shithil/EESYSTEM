#!/bin/bash
#bash bin/initServer.sh
MIP="172.76.0.2"
MASTERNAME="master1"
MASTERPORT=5087
SERVERNAME="server1.1"  #modify serer name
SERVERIP="172.76.0.4" #ip start with IP address 172.76.0.4
SERVERPORT=5090 #port start with 5090
docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus
docker run --cpuset-cpus="3-10" --memory="32g" --net Paxos_Network1 --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
