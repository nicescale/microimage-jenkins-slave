#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE

docker exec $CON_NAME ps ax|grep -i "jenkin[s]"
docker rm -f $CON_NAME

echo "---> The test pass"
