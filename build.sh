#!/usr/bin/bash -x

docker build -t mynotebook .
docker image prune -f