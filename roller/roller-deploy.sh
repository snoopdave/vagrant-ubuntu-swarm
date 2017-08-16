#!/usr/bin/env bash

docker service create \
    --name roller \
    --network roller \
    --replicas 1 \
    --mount type=bind,src=/var/nfs/roller,dst=/var/lib/roller\
    -e MYSQL_HOST=mysql \
    -e STORAGE_ROOT=/var/lib/roller \
    -p 8080:8080 \
    snoopdave/roller
