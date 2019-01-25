FROM ubuntu:18.04

COPY equibit-core/src/equibit-cli /bin/equibit-cli
COPY equibit-core/src/equibitd /bin/equibitd
COPY files/ec /bin/ec
COPY files/spam /bin/spam

WORKDIR	/spam 

COPY files/equibit.conf /spam/equibit.conf


RUN \
	apt-get update && \
	apt-get install -y python3 software-properties-common libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libevent-dev libminiupnpc-dev libzmq3-dev && \
	add-apt-repository ppa:bitcoin/bitcoin && \
	apt-get update && \
	apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN \
	apt-get install -y sudo

CMD /bin/spam

# vim: set ft=dockerfile:
