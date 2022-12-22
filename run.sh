#!/bin/bash

while read container; do
    docker build -f ${container}/Dockerfile -t heinokesoe/${container}:latest ${container}
    docker push heinokesoe/${container}:latest
    docker image prune -af
done < list
