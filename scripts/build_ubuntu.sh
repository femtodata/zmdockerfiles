#!/bin/bash
cd $(dirname $0)/..
docker build --tag zoneminderhq/zoneminder:1.36-ubuntu18.04 -f release/ubuntu18.04/Dockerfile .
