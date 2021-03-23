#!/bin/bash -x
set -e -o pipefail

cd `dirname $0`

DIR=`pwd`
NOTEBOOK=9999
IMAGE=mynotebook
docker container stop "$IMAGE" || true
docker run -d -it --rm \
    --name "$IMAGE" \
    --publish "$NOTEBOOK:8888" \
    --volume "$DIR/shared:/root/shared" \
    "$IMAGE"
