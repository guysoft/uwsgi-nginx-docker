#!/usr/bin/env bash
set -e

use_tag="tiangolo/uwsgi-nginx:$NAME"

DOCKERFILE="$NAME"

if [ "$NAME" == "latest" ] ; then
    DOCKERFILE="python3.8"
fi

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t "$use_tag" --file "./docker-images/${DOCKERFILE}.dockerfile" "./docker-images/"
