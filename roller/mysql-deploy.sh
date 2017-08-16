#!/usr/bin/env bash
docker service create \
    --name mysql \
    --network roller \
    --replicas 1 \
    --endpoint-mode dnsrr \
    --mount type=bind,src=/var/nfs/mysql,dst=/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=mysql \
    mariadb
