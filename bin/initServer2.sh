#!/bin/bash
#bash bin/initServer.sh
MIP="10.0.1.100"
MASTERNAME="master5"
MASTERPORT=9087
SERVERNAME="server1"  #modify serer name
SERVERIP="10.0.1.4" #ip start with IP address 172.76.0.4
SERVERPORT=5090 #port start with 5090
CPUPROFILE="noprofiling"
NET=overnet #network name start with Paxos_Network1
MSIZE=16777216

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
#docker run --cpuset-cpus="11-12" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
docker run --privileged --cap-add=NET_ADMIN --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} --detach --sysctl=net.core.somaxconn=16777216   --sysctl=net.ipv4.tcp_max_syn_backlog=16777216 -e CPUPROFILE=${CPUPROFILE} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}

NET=overnet 
SERVERNAME="server2"  #modify serer name
SERVERIP="10.0.1.5" #ip start with IP address 172.76.0.4
SERVERPORT=5091 #port start with 5090
CPUPROFILE="noprofiling"
#network name start with Paxos_Network1

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
#docker run --cpuset-cpus="11-12" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
docker run --privileged --cap-add=NET_ADMIN --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} --detach --sysctl=net.core.somaxconn=16777216  --sysctl=net.ipv4.tcp_max_syn_backlog=16777216 -e CPUPROFILE=${CPUPROFILE} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}

NET=overnet 
SERVERNAME="server3"  #modify serer name
SERVERIP="10.0.1.6" #ip start with IP address 172.76.0.4
SERVERPORT=5092 #port start with 5090
CPUPROFILE="noprofiling"
 #network name start with Paxos_Network1

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
#docker run --cpuset-cpus="11-12" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
docker run --privileged --cap-add=NET_ADMIN --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} --detach --sysctl=net.core.somaxconn=16777216   --sysctl=net.ipv4.tcp_max_syn_backlog=16777216 -e CPUPROFILE=${CPUPROFILE} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}

NET=overnet 
SERVERNAME="server4"  #modify serer name
SERVERIP="10.0.1.7" #ip start with IP address 172.76.0.4
SERVERPORT=5093 #port start with 5090
CPUPROFILE="noprofiling"
 #network name start with Paxos_Network1

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
#docker run --cpuset-cpus="11-12" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
docker run --privileged --cap-add=NET_ADMIN --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} --detach  --sysctl=net.core.somaxconn=16777216   --sysctl=net.ipv4.tcp_max_syn_backlog=16777216 -e CPUPROFILE=${CPUPROFILE} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}

NET=overnet 
SERVERNAME="server5"  #modify serer name
SERVERIP="10.0.1.8" #ip start with IP address 172.76.0.4
SERVERPORT=5094 #port start with 5090
CPUPROFILE="cpu.prof"
 #network name start with Paxos_Network1

docker rm ${SERVERNAME}
docker rmi ${SERVERNAME}
docker build --tag ${SERVERNAME} .

#update cpus 19-22,3-7,7-10,15-18,11-14
#docker run --cpuset-cpus="11-12" --memory="8g" --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
docker run --privileged --cap-add=NET_ADMIN --net ${NET} --ip=${SERVERIP} -p ${SERVERPORT}:${SERVERPORT} --sysctl=net.core.somaxconn=16777216  --sysctl=net.ipv4.tcp_max_syn_backlog=16777216  -e CPUPROFILE=${CPUPROFILE} -e MADDR=${MIP} -e MPORT=${MASTERPORT} -e SADDR=${SERVERIP} -e SPORT=${SERVERPORT} -e TYPE="server" --name ${SERVERNAME} ${SERVERNAME}
