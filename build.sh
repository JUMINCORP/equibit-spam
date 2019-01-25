#!/usr/bin/env bash
[ -d ./equibit-core ] || git clone -b issues/#219-stage git@github.com:Equibit/equibit-core.git
docker build -t eqbcore-builder -f builder/Dockerfile builder
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd)/equibit-core:/equibit-core eqbcore-builder sh -c "
	cd /equibit-core && \
	./autogen.sh && \
	./configure --without-gui --disable-tests && \
	make
	"
docker build -t darvs/eqb-spam:v01.024 .
