#!/usr/bin/env bash
NAME=node

[ -z "$(docker ps -q -f name=${NAME})" ] || docker stop ${NAME}
[ -z "$(docker ps -a -q -f name=${NAME})" ] || docker rm ${NAME}

docker run -d --name "${NAME}" \
	-p 17331:17331 \
	-p 18331:18331 \
	-v /var/lib/equibit:/data \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-v /etc/localtime:/etc/localtime \
        -v /etc/timezone:/etc/timezone \
	darvs/eqb-spammer:v01.024 \
	/bin/equibitd -datadir=/data -printoconsole
