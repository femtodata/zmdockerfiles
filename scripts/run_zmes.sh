#!/bin/bash
cd $(dirname $0)/..

docker run -i -t \
       --name zmes \
       zoneminderhq/zoneminder:1.36-ubuntu18.04_zmes \
       bash
