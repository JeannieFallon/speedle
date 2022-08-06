#!/bin/bash

HOST=$1
PORT=$2

# Run Speedle in DEBUG mode (use in DEV container)
exec python -m flask --app flaskr --debug run --host=${HOST} --port=${PORT}
