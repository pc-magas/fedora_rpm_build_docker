#!/usr/bin/env bash

docker build -t pcmagas/fedora-rpmpkg .

BRANCH=${GITHUB_REF##*/}

if [[ $BRANCH == 'master' ]]; then

    GHCR_IMAGE="ghcr.io/${GITHUB_REPOSITORY,,}:latest"
    docker tag pcmagas/fedora-rpmpkg "$GHCR_IMAGE"
    
    # Authenticate with GitHub Container Registry
    echo "$GHCR_TOKEN" | docker login ghcr.io -u "$GITHUB_ACTOR" --password-stdin

    # Push to GHCR
    docker push "$GHCR_IMAGE"

    docker image push pcmagas/fedora-rpmpkg:latest
fi