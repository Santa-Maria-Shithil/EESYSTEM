#!/bin/bash
#bash bin/initClient.sh
MIP="10.0.1.100"
MASTERNAME="master5"
MASTERPORT=9087
CLIENTNAME="client1"  #modify client name
CLIENTIP="10.0.1.20" #ip start with IP address 172.75.0.200
CLIENTPORT=5099 #port start with 5090
NCLIENTS=30 # minimum 1
NREQ=100000 # total number of req per client
docker stop ${CLIENTNAME}
docker rm ${CLIENTNAME}
docker rmi ${CLIENTNAME}
docker build --tag ${CLIENTNAME} .
#docker run --cpuset-cpus="13-63" --memory="8g" --net Paxos_Network5 --ip=${CLIENTIP} -p ${CLIENTPORT}:${CLIENTPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e Q=${NREQ} -e NCLIENTS=${NCLIENTS} -e TYPE="client" --name ${CLIENTNAME} ${CLIENTNAME}
docker run --privileged --cap-add=NET_ADMIN --net overnet --ip=${CLIENTIP} -p ${CLIENTPORT}:${CLIENTPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e Q=${NREQ} -e NCLIENTS=${NCLIENTS} -e TYPE="client" --name ${CLIENTNAME} ${CLIENTNAME}


















