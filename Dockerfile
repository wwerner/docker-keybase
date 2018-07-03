FROM debian:stretch-slim

LABEL maintainer="Wolfgang Werner"

ENV KEYBASE_VERSION 1.0

# Base dependencies
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    jq \
    gpg \
    openssh-client \
    fuse \
    git-core \
    psmisc \
    libgconf-2-4 \
    libgtk2.0-0 \
    libunwind8 \
    libuuid1 \
    libindicator7 \
    libappindicator1 \
    gnome-icon-theme \
    libappindicator-dev \
  && curl -O https://prerelease.keybase.io/keybase_amd64.deb \
  && dpkg -i keybase_amd64.deb \
  && rm keybase_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# Dependencies for .NET builds
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    libunwind8 \
    libuuid1 \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# Dependencies for Java/Maven builds
RUN apt-get update \
  && mkdir -p /usr/share/man/man1 \
  && apt-get -y --no-install-recommends install \
      openjdk-8-jdk-headless \
      openjdk-8-jre-headless \
      maven \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# Add keybase user as keybase cannot be run as root
RUN adduser --disabled-password --gecos "" keybaseme
USER keybaseme

RUN run_keybase
ENTRYPOINT ["/bin/bash", "-c"]
