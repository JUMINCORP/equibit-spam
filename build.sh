#!/usr/bin/env bash
git submodule init
git submodule update
docker build -f builder.Dockerfile -t eqb-core-builder . 
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd)/equibit-core:/equibit-core eqb-core-builder sh -c "
	cd /equibit-core && \
	./autogen.sh && \
	./configure --without-gui --disable-tests && \
	make
	" 
docker build -f base.Dockerfile -t darvs/eqb-node-base:v01.024 -t darvs/eqb-node-base:latest .
