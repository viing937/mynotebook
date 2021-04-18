#!/bin/bash -x
set -e -o pipefail

cd `dirname $0`
NAME=mynotebook
PORT=9999
DIR=`pwd`

docker container stop "$NAME" || true
docker run -d -it --rm \
    --name "$NAME" \
    --publish "$PORT:8888" \
    --volume "$DIR/shared:/root/shared" \
    "ving/mynotebook"
