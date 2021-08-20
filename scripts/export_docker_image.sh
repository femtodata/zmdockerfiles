#!/bin/bash
mkdir -p $(dirname $0)/../docker_images
cd $(dirname $0)/../docker_images

docker save zoneminderhq/zoneminder:1.36-ubuntu18.04 | gzip > zoneminderhq_zoneminder_1.36-ubuntu18.04.tar.gz
