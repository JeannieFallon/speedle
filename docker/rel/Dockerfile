### Deployment image ###
FROM python:3.10.4-slim-bullseye


RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    make

COPY docker/requirements.txt /tmp/requirements.txt
RUN python -m pip install --upgrade pip && \
    python -m pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

#FIXME only copy app files
COPY . .

CMD [ "python3", "-m" , "flask", "--app", "flaskr", "run", "--host=0.0.0.0", "--port=5555"]
