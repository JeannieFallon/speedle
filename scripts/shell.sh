#!/bin/bash

PROJ=$1

#FIXME workdir should be directly in container root
# Run shell into development image with project dir mounted
exec docker run -it --rm \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name ${PROJ}\
    --hostname debian \
    ${PROJ}
