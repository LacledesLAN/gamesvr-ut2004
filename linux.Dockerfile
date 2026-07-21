ARG CONTAINER_REGISTRY="docker.io"

FROM $CONTAINER_REGISTRY/lacledeslan/steamcmd AS ut2004-builder

ARG CONTENT_SERVER=content.lacledeslan.net

RUN curl -sSL "http://${CONTENT_SERVER}/fastDownloads/_installers/ut2004-3339server-allcontentpacks.zip" -o /tmp/ut2004-3339server-allcontentpacks.zip && \
    echo "0c858f3a490d88aee035afd4bf4d62ba9b9f15db /tmp/ut2004-3339server-allcontentpacks.zip" | sha1sum -c - && \
    unzip /tmp/ut2004-3339server-allcontentpacks.zip -d /output && \
    rm -f /tmp/ut2004-3339server-allcontentpacks.zip;

RUN curl -sSL "http://${CONTENT_SERVER}/fastDownloads/_installers/ut2004-3369patch-2-linux.tar.bz2" -o /tmp/ut2004-3369patch-2-linux.tar.bz2 && \
    echo "a8cc33877a02a0a09c288b5fc248efde282f7bdf  /tmp/ut2004-3369patch-2-linux.tar.bz2" | sha1sum -c - && \
    tar -xvjf /tmp/ut2004-3369patch-2-linux.tar.bz2 -C /output UT2004-Patch/ --strip-components=1 && \
    rm -f /tmp/ut2004-3369patch-2-linux.tar.bz2;


#---------------------------------
FROM debian:bullseye-slim

ARG BUILD_DATE=unspecified \
    BUILD_NODE=unspecified \
    GIT_REVISION=unspecified

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

HEALTHCHECK NONE

LABEL architecture="amd64" \
      com.lacledeslan.build-node=$BUILD_NODE \
      maintainer="Laclede's LAN <contact@lacledeslan.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.description="Unreal Tournament 2004 Dedicated Server" \
      org.opencontainers.image.revision=$GIT_REVISION \
      org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-ut2004" \
      org.opencontainers.image.vendor="Laclede's LAN"

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
        ca-certificates lib32gcc-s1 libstdc++5:i386 libstdc++6:i386 libsdl1.2debian locales locales-all tmux && \
    apt-get clean && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

# Set up Environment
RUN useradd --home /app --gid root --system UT2004 && \
    mkdir -p /app/installers && \
    chown UT2004:root -R /app;

COPY --chown=UT2004:root --from=ut2004-builder /output /app

COPY --chown=UT2004:root /linux/ll-tests/*.sh /app/ll-tests/

RUN chmod +x /app/ll-tests/*.sh

# Slightly modified stock server, to prevent calls to decommisioned master list server
COPY --chown=UT2004:root ./dist/System/UT2004.ini /app/System/UT2004.ini

USER UT2004

RUN echo "Running server for 120 seconds to generate files and update revision levels" && \
    cd /app/System && \
    timeout --preserve-status 120 ./ucc-bin server DM-Gael?game=XGame.xDeathMatch -nohomedir -lanplay

WORKDIR /app/System/

CMD ["/bin/bash"]

ONBUILD USER root
