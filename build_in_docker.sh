#!/bin/bash

set -e

image=zmk-build-img
sum=$(cat docker/* | md5sum)
tag=${sum:0:6}

if ! docker image inspect ${image}:${tag} > /dev/null 2>&1; then
    echo "build docker image"
    docker build -t ${image}:${tag} ./docker
fi

docker run -e BUILD_UID=$(id -u) -e BUILD_GID=$(id -g) -e BUILD_CMD="$*" -it -v $(pwd):/home/build_user/zmk ${image}:${tag} /bin/bash /root/run_build.sh
