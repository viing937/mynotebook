#!/bin/bash -x
set -e -o pipefail

cd `dirname $0`

docker container stop mynotebook || true
docker build -t mynotebook .
docker image prune -f
