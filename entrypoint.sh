#!/usr/bin/env bash

usermod -u ${UID} pkgbuild
groupmod -g ${GID} pkgbuild

chown -R pkgbuild:pkgbuild /home/pkgbuild/rpmbuild/RPMS
chown -R pkgbuild:pkgbuild /home/pkgbuild/rpmbuild/SRPMS
chown -R pkgbuild:pkgbuild /home/pkgbuild/code


sudo -u pkgbuild -- "$@"
