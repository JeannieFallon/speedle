#!/bin/bash

NAME=$1
PORT=$2

docker build -f docker/dev/Dockerfile -t ${NAME} .

# Run shell into development image with project dir mounted
docker run -it --rm \
    --publish ${PORT}:${PORT} \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name ${NAME}\
    --hostname ${NAME} \
    ${NAME}
