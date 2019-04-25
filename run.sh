#!/usr/bin/bash

# workround: https://github.com/docker/toolbox/issues/673#issuecomment-355275054
docker()
{
    (export MSYS_NO_PATHCONV=1; "docker.exe" "$@")
}

DIR=`pwd`

IPYTHON=8888
TENSORBOARD=6006
IMAGE=mynotebook
docker run -d -it --rm \
    --name "$IMAGE" \
    --publish "$IPYTHON:$IPYTHON" \
    --publish "$TENSORBOARD:$TENSORBOARD" \
    --volume "$DIR:/root/shared" \
    "$IMAGE"
