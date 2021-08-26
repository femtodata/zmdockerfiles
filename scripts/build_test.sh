#!/bin/bash
cd $(dirname $0)/..
docker build --tag zoneminderhq/zoneminder:1.34-ubuntu18.04 -f release/test/Dockerfile .
