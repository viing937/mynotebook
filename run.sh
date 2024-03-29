#!/bin/bash -x
set -e -o pipefail

cd `dirname $0`
NAME=mynotebook
PORT=19999
DIR=`pwd`

docker container stop "$NAME" || true
docker container rm "$NAME" || true
docker run -d \
    --name "$NAME" \
    --publish "$PORT:8888" \
    --restart=always \
    --volume "$DIR/shared:/root/shared" \
    "ving/mynotebook:latest"
