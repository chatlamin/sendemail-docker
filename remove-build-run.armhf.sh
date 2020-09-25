#!/bin/bash

#Настройки
source  settings.sh

docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker rmi $IMAGE_ARMHF
docker rmi $IMAGE_REPOSITORY_OLD
docker volume rm $(docker volume ls -f dangling=true -q)
./build-$ARCH_ARMHF.sh
./run-$ARCH_ARMHF.sh