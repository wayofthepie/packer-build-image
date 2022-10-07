#!/usr/bin/env bash

set -e

image_name=${1:-packer-build}
docker build --tag ${image_name} .
docker run -i -v ${PWD}:/var/tmp ${image_name} /var/tmp/test.sh
