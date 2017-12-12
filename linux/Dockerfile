# escape=`
FROM debian:stretch-slim

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

HEALTHCHECK NONE

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        bzip2 ca-certificates curl lib32gcc1 libstdc++5:i386 libstdc++6:i386 libsdl1.2debian procps screen unzip &&`
    apt-get clean &&`
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

LABEL maintainer="Laclede's LAN <contact @lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="Unreal Tournament 2004 Dedicated Server" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-ut2004"

# Set up Enviornment
RUN useradd --home /app --gid root --system UT2004 &&`
    mkdir -p /app/installers &&`
    chown UT2004:root -R /app;

USER UT2004

RUN curl -sSL "http://raw.content.lacledeslan.net/fastDownloads/_installers/ut2004-3339server-allcontentpacks.zip" -o /tmp/ut2004-3339server-allcontentpacks.zip &&`
    echo "0c858f3a490d88aee035afd4bf4d62ba9b9f15db /tmp/ut2004-3339server-allcontentpacks.zip" | sha1sum -c - &&`
    unzip /tmp/ut2004-3339server-allcontentpacks.zip -d /app &&`
    rm -f /tmp/ut2004-3339server-allcontentpacks.zip;

RUN curl -sSL "http://raw.content.lacledeslan.net/fastDownloads/_installers/ut2004-3369patch-linux.tar.bz2" -o /tmp/ut2004-3369patch-linux.tar.bz2 &&`
    echo "557fa10d9eae2d95542598ebc78e931b92cf4749  /tmp/ut2004-3369patch-linux.tar.bz2" | sha1sum -c - &&`
    tar -xvjf /tmp/ut2004-3369patch-linux.tar.bz2 -C /app UT2004-Patch/ --strip-components=1 &&`
    rm -f /tmp/ut2004-3369patch-linux.tar.bz2;

COPY /UT2004.ini /app/System/UT2004.ini

RUN echo "SRVER-WDGCD-LJFMG-AFQEC" > /app/System/cdkey && `
    echo "Running server for 120 seconds to generate files and update revision levels" && `
    cd /app/System && `
    timeout --preserve-status 120 ./ucc-bin server DM-Gael?game=XGame.xDeathMatch -nohomedir -lanplay

WORKDIR /app/System

ONBUILD USER root
