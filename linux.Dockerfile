# escape=`
ARG CONTAINER_REGISTRY="docker.io"

FROM $CONTAINER_REGISTRY/lacledeslan/steamcmd:linux as ut2004-builder

ARG contentServer=content.lacledeslan.net

RUN curl -sSL "http://${contentServer}/fastDownloads/_installers/ut2004-3339server-allcontentpacks.zip" -o /tmp/ut2004-3339server-allcontentpacks.zip &&`
    echo "0c858f3a490d88aee035afd4bf4d62ba9b9f15db /tmp/ut2004-3339server-allcontentpacks.zip" | sha1sum -c - &&`
    unzip /tmp/ut2004-3339server-allcontentpacks.zip -d /output &&`
    rm -f /tmp/ut2004-3339server-allcontentpacks.zip;

RUN curl -sSL "http://${contentServer}/fastDownloads/_installers/ut2004-3369patch-2-linux.tar.bz2" -o /tmp/ut2004-3369patch-2-linux.tar.bz2 &&`
    echo "a8cc33877a02a0a09c288b5fc248efde282f7bdf  /tmp/ut2004-3369patch-2-linux.tar.bz2" | sha1sum -c - &&`
    tar -xvjf /tmp/ut2004-3369patch-2-linux.tar.bz2 -C /output UT2004-Patch/ --strip-components=1 &&`
    rm -f /tmp/ut2004-3369patch-2-linux.tar.bz2;

#=======================================================================
FROM debian:bullseye-slim

HEALTHCHECK NONE

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        ca-certificates lib32gcc-s1 libstdc++5:i386 libstdc++6:i386 libsdl1.2debian locales locales-all tmux &&`
    apt-get clean &&`
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment &&`
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

LABEL com.lacledeslan.build-node=$BUILDNODE `
        org.opencontainers.image.source=https://github.com/lacledeslan/gamesvr-ut2004 `
        org.opencontainers.image.title="Unreal Tournament 2004 Dedicated Server" `
        org.opencontainers.image.url=https://github.com/LacledesLAN/README.1ST `
        org.opencontainers.image.vendor="Laclede's LAN" `
        org.opencontainers.image.version=$SOURCE_COMMIT

# Set up Enviornment
RUN useradd --home /app --gid root --system UT2004 &&`
    mkdir -p /app/installers &&`
    chown UT2004:root -R /app;

# `RUN true` lines are work around for https://github.com/moby/moby/issues/36573
COPY --chown=UT2004:root --from=ut2004-builder /output /app
RUN true

COPY --chown=UT2004:root /linux/ll-tests/*.sh /app/ll-tests/
RUN chmod +x /app/ll-tests/*.sh

# Slightly modified stock server, to prevent calls to decommisioned master list server
COPY --chown=UT2004:root ./dist/System/UT2004.ini /app/System/UT2004.ini

USER UT2004

RUN echo "Running server for 120 seconds to generate files and update revision levels" && `
    cd /app/System && `
    timeout --preserve-status 120 ./ucc-bin server DM-Gael?game=XGame.xDeathMatch -nohomedir -lanplay

WORKDIR /app/System/

CMD ["/bin/bash"]

ONBUILD USER root
