#!/bin/sh

docker run -d -p 5000:5000 --name=swarm-viz \
 -e HOST=localhost \
 -e PORT=5000 \
 -e HOST=$(docker-machine ip manager-1) \
 -v /var/run/docker.sock:/var/run/docker.sock \
 dockersamples/visualizer
