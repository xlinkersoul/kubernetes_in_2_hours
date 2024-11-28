#!/bin/bash
echo "remove docker image"
docker image ls | grep 'library/nginx' | awk '{print $3}' | xargs docker image rm
echo "docker pull k-harbor-01.server.maas/library/nginx:latest"
docker pull k-harbor-01.server.maas/library/nginx:latest
echo "================================================================="
docker image ls | egrep "REPOSITORY|k-harbor-01.server.maas/library/nginx"
