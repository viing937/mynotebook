#!/usr/bin/bash -x

docker container stop mynotebook
docker build -t mynotebook .
docker image prune -f