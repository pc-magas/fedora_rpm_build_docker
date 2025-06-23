#!/usr/bin/env bash

usermod -u ${UID} pkgbuild
groupmod -g ${GID} pkgbuild

chown -R pkgbuild:pkgbuild /home/pkgbuild/rpmbuild
chown -R pkgbuild:pkgbuild /home/pkgbuild/code

echo $COPR_SECRET > /home/pkgbuild/.config/copr
chown -R pkgbuild:pkgbuild /home/pkgbuild/.config

sudo -u pkgbuild -- "$@"
