#!/bin/sh

set -e

# Uses a docker container that mirrors the Heroku runtime environment
# (Ubuntu 14.04) so that we can vendor NGINX as a binary. Mounts a folder
# to /build to "receive" the binary

CONTAINER=nginx/compiler

eval $(docker-machine env default)

docker build -t $CONTAINER .

docker run -it \
  -v `pwd`/scripts/build_nginx.sh:/root/build_nginx.sh \
  -v `pwd`/build/:/build \
  $CONTAINER
