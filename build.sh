#!/bin/bash

set -x
set -e

tag=2.0
docker build -t brainlife/pydeface . 
docker tag brainlife/pydeface brainlife/pydeface:$tag
docker push brainlife/pydeface:$tag
