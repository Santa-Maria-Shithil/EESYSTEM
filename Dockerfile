# syntax=docker/dockerfile:1
FROM alpine:latest
#FROM ubuntu:20.04

#ENV TZ=Europe/Kiev
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN apt-get update

RUN echo 'root:root' |chpasswd


#RUN apt-get clean && \
 #   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apk add --no-cache git make musl-dev go

 
#RUN /bin/sh -c "apt-get update && apt-get -y install iproute2"

RUN apk add iproute2

#RUN sysctl -w net.ipv4.tcp_max_syn_backlog = 12582912

#RUN tc qdisc replace dev eth0 root  pfifo_fast

# install basic libraries
#RUN apt-get update
#RUN apt update



#FROM golang

#RUN apt-get -y install make
#RUN apt -y install golang-go


ENV NAME=/EESYSTEM
ENV PATH="/EESYSTEM/bin:${PATH}"
#export GOPATH=$HOME/copilot  for server and mac wihout docker
#export GO111MODULE=auto for mac without docker
#go install ./src/eclientol   installing eclientol using go without docker (inside copilot folder)
#go build -o master ./src/master
#./master


#ENV NAME=/go/epaxos
RUN mkdir $NAME

ENV GO111MODULE=off
ENV GOPATH=$NAME

ADD . $NAME

ENV TYPE ""
# type of the instance

#RUN go install master
#RUN go install server
#RUN go install client


WORKDIR $NAME
RUN go version

RUN make



RUN pwd
RUN echo $PATH

RUN ls

ENV TYPE master

# env variables for master------------------
ENV MADDR localhost
# master address   
ENV MPORT 7087
# master port
ENV NREPLICAS 5
# number of replicas

#env variables for server
ENV SPORT ""
# server port
ENV SADDR localhost
ENV DoMencius false
ENV DoGpaxos false
ENV DoEpaxos false
ENV PROCS 2
ENV CPUPROFILE ""
ENV THRIFTY false
ENV EXEC false
ENV DREPLY false
ENV BEACON false
ENV DURABLE false

#env variables for client
ENV Q 1000000
ENV WRITES 100
ENV NOLEADER false
ENV FAST false
ENV ROUNDS 1
ENV CHECK false
ENV EPS 0
ENV CONFLICTS -1
ENV S 2
ENV V 1
ENV NCLIENTS 1
ENV NRUNTIME 400



#RUN run.sh
#CMD bin/run.sh
CMD ["//bin/sh", "bin/run.sh"]
#CMD ["bin/run.sh"]
