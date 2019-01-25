#!/usr/bin/env bash
NAME=spam

[ -z "$(docker ps -q -f name=${NAME})" ] || docker stop ${NAME}
[ -z "$(docker ps -a -q -f name=${NAME})" ] || docker rm ${NAME}

docker run -d --name "${NAME}" \
	-v /etc/localtime:/etc/localtime \
        -v /etc/timezone:/etc/timezone \
	darvs/eqb-spam:v01.024
