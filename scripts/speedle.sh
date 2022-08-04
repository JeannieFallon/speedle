#!/bin/bash

NAME=$1
PORT=$2

docker build -f docker/rel/Dockerfile -t ${NAME} .

docker run -it --rm \
    --publish ${PORT}:${PORT} \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name ${NAME}\
    --hostname ${NAME} \
    ${NAME}
