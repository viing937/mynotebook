#!/bin/bash -x

# workround: https://github.com/docker/toolbox/issues/673#issuecomment-355275054
docker()
{
    (export MSYS_NO_PATHCONV=1; "docker.exe" "$@")
}

DIR=`pwd`

NOTEBOOK=8888
TENSORBOARD=6006
IMAGE=mynotebook
docker container stop "$IMAGE"
docker run -d -it --rm \
    --name "$IMAGE" \
    --publish "$NOTEBOOK:$NOTEBOOK" \
    --publish "$TENSORBOARD:$TENSORBOARD" \
    --volume "$DIR/shared:/root/shared" \
    "$IMAGE"
