#!/usr/bin/env bash

IMAGE=lenusch/portfolio-performance

docker run \
	--rm -it \
	--name portfolio-performance \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $(pwd):/data \
	$IMAGE
