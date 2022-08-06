#!/bin/bash

NAME=$1
PORT=$2
TAG=release

docker build -f docker/rel/Dockerfile -t ${NAME}:${TAG} .

# Run Speedle as containerized application
docker run --rm \
    --publish ${PORT}:${PORT} \
    --name ${NAME}\
    ${NAME}:${TAG}
