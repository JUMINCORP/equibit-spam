#!/usr/bin/env bash
docker build -f spam.Dockerfile -t darvs/eqb-spam:v01.024 -t darvs/eqb-spam:latest .

NAME=spam
PRIVKEY=cQazFLhD5jXVAkYad2A5yfnPS8G7WPNkV2CDyPxHkcdGPexrpC4U

[ -z "$(docker ps -q -f name=${NAME})" ] || docker stop ${NAME}
[ -z "$(docker ps -a -q -f name=${NAME})" ] || docker rm ${NAME}

docker run -d --name "${NAME}" \
	-v /etc/localtime:/etc/localtime \
        -v /etc/timezone:/etc/timezone \
	-v $(pwd)/testnet-alpha/contrib/eqb-spam:/spam \
	-e PRIVKEY=${PRIVKEY} \
	darvs/eqb-spam:v01.024

docker exec -it spam bash
