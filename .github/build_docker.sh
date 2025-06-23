#!/usr/bin/env bash


GITHUB_REPOSITORY="${GITHUB_REPOSITORY:-pc-magas/fedora_rpm_build_docker}"
GHCR_IMAGE="ghcr.io/${GITHUB_REPOSITORY,,}"

docker build -t pcmagas/fedora-rpmpkg -t ghcr.io/pc-magas/fedora_rpm_build_docker .

BRANCH=${GITHUB_REF##*/}

if [[ $BRANCH == 'master' ]]; then
    
    # Authenticate with GitHub Container Registry
    echo "$GHCR_TOKEN" | docker login ghcr.io -u "$GITHUB_ACTOR" --password-stdin

    # Push to GHCR
    docker push "$GHCR_IMAGE:latest"

    docker image push pcmagas/fedora-rpmpkg:latest
fi