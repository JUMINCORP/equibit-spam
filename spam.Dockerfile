FROM darvs/eqb-node-base:latest

COPY files/spam /usr/local/bin/spam
COPY files/equibit.conf /spam/equibit.conf

WORKDIR	/spam 

ENTRYPOINT /usr/local/bin/spam

# vim: set ft=dockerfile:
