FROM ubuntu:18.04

RUN \
	apt-get update && \
	apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev software-properties-common libminiupnpc-dev libzmq3-dev  && \
	add-apt-repository ppa:bitcoin/bitcoin && \
	apt-get update && \
	apt-get install -y libdb4.8-dev libdb4.8++-dev
