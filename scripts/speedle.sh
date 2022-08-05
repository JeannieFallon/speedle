#!/bin/bash

NAME=$1
PORT=$2

docker build -f docker/rel/Dockerfile -t ${NAME} .

# Run Speedle as containerized application
docker run --rm \
    --publish ${PORT}:${PORT} \
    --name ${NAME}\
    ${NAME}
