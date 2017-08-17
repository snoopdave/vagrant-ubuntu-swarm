#!/usr/bin/env bash

# NB: database named rollerdb must exist before you deploy roller

sudo mkdir /var/nfs/roller

docker service create \
    --name roller \
    --network roller \
    --replicas 1 \
    --mount type=bind,src=/var/nfs/roller,dst=/var/lib/roller\
    -e MYSQL_HOST=mysql \
    -e STORAGE_ROOT=/var/lib/roller \
    -p 8080:8080 \
    snoopdave/roller
