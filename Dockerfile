FROM fedora:41

ENV COPR_SECRET=""

RUN dnf update -y && \
    dnf install -y rpmdevtools rpmlint make golang copr-cli sudo && \
    useradd -m pkgbuild &&\
    dnf clean all
    
COPY --chmod=0755 ./entrypoint.sh /usr/local/bin/entrypoint

USER pkgbuild
WORKDIR /home/pkgbuild

RUN mkdir code &&\
    mkdir -p /home/pkgbuild/.config &&\
    rpmdev-setuptree

VOLUME /home/pkgbuild/code
VOLUME /home/pkgbuild/rpmbuild/SOURCES
VOLUME /home/pkgbuild/rpmbuild/SPECS
VOLUME /home/pkgbuild/rpmbuild/SRPMS
VOLUME /home/pkgbuild/rpmbuild/RPMS
VOLUME /home/pkgbuild/.config

USER root

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
CMD ["/bin/bash"]
