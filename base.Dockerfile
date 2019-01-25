FROM ubuntu:18.04

COPY equibit-core/src/equibit-cli /usr/local/bin/equibit-cli
COPY equibit-core/src/equibitd /usr/local/bin/equibitd
COPY files/create-node-user /usr/local/bin/create-node-user
COPY files/ec /usr/local/bin/ec
COPY files/eqbnode /usr/local/bin/eqbnode

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
