#!/bin/bash

NAME=$1
PORT=$2

#FIXME workdir should be directly in container root
# ...or maybe the whole thing should just be shipped as a Docker image


# Run shell into development image with project dir mounted
exec docker run -it --rm \
    --publish ${PORT}:${PORT} \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name ${NAME}\
    --hostname ${NAME} \
    ${NAME}
