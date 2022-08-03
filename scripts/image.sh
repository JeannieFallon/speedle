#!/bin/bash

PROJ=$1

exec docker build -f docker/Dockerfile -t ${PROJ} .
