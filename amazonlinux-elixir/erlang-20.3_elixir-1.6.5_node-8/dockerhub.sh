#!/bin/bash

tag="tielur/amazonlinux_elixir:v1_erlang-20.3_elixir-1.6.5_node-8"

if [[ "$@" == "build" ]]; then
  docker build . -t "$tag"
elif [[ "$@" == "publish" ]]; then
  docker push "$tag"
else
  echo "build - build the docker image locally"
  echo "publish - push the image to Docker Hub"
  echo "Usage: $(basename $0) build|publish"
fi