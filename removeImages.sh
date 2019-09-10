#!/usr/bin/env bash

#Remove all exited containers
docker rm $(docker ps -a -f status=exited -q)

#Stop and remove all containers
docker stop $(docker ps -a -q)
docker rm -f $(docker ps -a -q)

#Remove dangling volumes - Docker 1.9 and later
docker volume ls
docker volume rm $(docker volume ls -f dangling=true -q)

#remove a container and its volume
docker rm -v container_name

#Remove all images
docker rmi -f $(docker images -a -q)