#!/usr/bin/env bash
[ -d ./equibit-core ] || git clone -b issues/#219-stage git@github.com:Equibit/equibit-core.git
docker build -f builder.Dockerfile -t eqb-core-builder . 
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd)/equibit-core:/equibit-core eqb-core-builder sh -c "
	cd /equibit-core && \
	./autogen.sh && \
	./configure --without-gui --disable-tests && \
	make
	" 
docker build -f base.Dockerfile -t darvs/eqb-node-base:v01.024 -t darvs/eqb-node-base:latest .
docker build -f node.Dockerfile -t darvs/eqb-node:v01.024 -t darvs/eqb-node:latest .
docker build -f spam.Dockerfile -t darvs/eqb-spam:v01.024 -t darvs/eqb-spam:latest .
