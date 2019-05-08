#!/bin/bash -x

DIR=`pwd`
NOTEBOOK=8888
IMAGE=mynotebook
docker container stop "$IMAGE"
docker run -d -it --rm \
    --name "$IMAGE" \
    --publish "$NOTEBOOK:$NOTEBOOK" \
    --volume "$DIR/shared:/root/shared" \
    "$IMAGE"
