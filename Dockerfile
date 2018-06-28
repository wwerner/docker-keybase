FROM debian:stretch-slim

LABEL maintainer="Wolfgang Werner <mail@wolfgang-werner.net>"

ENV KEYBASE_VERSION 1.0

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    fuse \
    git-core \
    psmisc \
    libgconf-2-4 \
    libgtk2.0-0 \
    libunwind8 \
    libuuid1 \
    libindicator7 \
    libappindicator1 \
    openjdk-8-jdk \
    gnome-icon-theme \
    libappindicator-dev \
  && curl -O https://prerelease.keybase.io/keybase_amd64.deb \
  && dpkg -i keybase_amd64.deb \
  && rm keybase_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN curl -O http://artfiles.org/apache.org/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz \
  && tar xzf apache-maven-3.5.4-bin.tar.gz \
  && rm maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz \
  && ln -s apache-maven-3.5.4/bin/mvn /bin/mvn \
  && chmod a+x /bin/mvn
  
RUN apt-get update \
  && apt-get -y install \
      openjdk-8-jdk \
      maven \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN adduser --disabled-password --gecos "" keybaseme
USER keybaseme

RUN run_keybase
ENTRYPOINT ["/bin/bash", "-c"]
