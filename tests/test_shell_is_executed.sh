#!/usr/bin/env bash

docker run \
    -e UID=$(id -u) -e GID=$(id -g)\
    -ti \
    ghcr.io/pc-magas/fedora_rpm_build_docker /bin/bash