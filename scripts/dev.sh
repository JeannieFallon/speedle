#!/bin/bash

NAME=$1

exec docker build -f docker/dev/Dockerfile -t ${NAME} .
