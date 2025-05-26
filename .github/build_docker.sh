#!/usr/bin/env bash

docker build -t pcmagas/fedora-rpmpkg .

BRANCH=${GITHUB_REF##*/}

if [[ $BRANCH == 'master' ]]; then
    docker image push pcmagas/fedora-rpmpkg:latest
fi