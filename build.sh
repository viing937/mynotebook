#!/bin/bash -x
set -e -o pipefail

docker container stop mynotebook || true
docker build -t mynotebook .
docker image prune -f
