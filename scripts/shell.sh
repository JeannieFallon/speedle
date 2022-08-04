#!/bin/bash

NAME=$1
PORT=$2

# Run shell into development image with project dir mounted
exec docker run -it --rm \
    --publish ${PORT}:${PORT} \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name ${NAME}\
    --hostname ${NAME} \
    ${NAME}
