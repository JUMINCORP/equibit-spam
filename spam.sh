#!/usr/bin/env bash
NAME=spam

[ -z "$(docker ps -q -f name=${NAME})" ] || docker stop ${NAME}
[ -z "$(docker ps -a -q -f name=${NAME})" ] || docker rm ${NAME}

docker run -d --name "${NAME}" \
	-p 17333:17331 \
	-p 18333:18331 \
	-v $(pwd)/data:/data \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-v /etc/localtime:/etc/localtime \
        -v /etc/timezone:/etc/timezone \
	darvs/eqb-spam:v01.024
