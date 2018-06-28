FROM debian:latest

LABEL maintainer="Wolfgang Werner <mail@wolfgang-werner.net>"

ENV KEYBASE_VERSION 1.0

RUN apt-get update \
&& apt-get install --no-install-recommends -y \
 ca-certificates \
 wget \
 libssl1.1 \
 openssl \
 fuse \
 git-core \
 psmisc \
 libgconf-2-4 \
 libgtk2.0-0 \
 libindicator7 \
 libappindicator1 \
 gnome-icon-theme \
 libappindicator-dev \
&& wget -q https://prerelease.keybase.io/keybase_amd64.deb \
&& dpkg -i keybase_amd64.deb \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean

RUN adduser --disabled-password --gecos "" keybaseme
USER keybaseme

RUN run_keybase
ENTRYPOINT ["/bin/bash", "-c"]
