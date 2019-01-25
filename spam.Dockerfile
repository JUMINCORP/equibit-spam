FROM darvs/eqb-node-base:latest

COPY files/spam /usr/local/bin/
COPY files/spam-equibit.conf /data/equibit.conf
#COPY testnet-alpha/contrib/eqb-spam/ /spam/

RUN \
	apt-get install -y python3-pip && \
	pip3 install python-bitcoinrpc

RUN \
	apt-get install -y vim

WORKDIR	/spam 

ENTRYPOINT /usr/local/bin/spam

# vim: set ft=dockerfile:
