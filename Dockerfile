FROM debian:latest

LABEL maintainer="Wolfgang Werner <mail@wolfgang-werner.net>"

ENV KEYBASE_VERSION 1.0

RUN adduser --disabled-password --gecos "" keybaseme

RUN apt-get update && apt-get install -y \
 curl \
 fuse \
 git \  
 libappindicator-dev 
RUN curl -O https://prerelease.keybase.io/keybase_amd64.deb \
 && dpkg -i keybase_amd64.deb; exit 0; 
 
RUN apt-get install -fy && rm -rf /var/lib/apt/lists/*


USER keybaseme

RUN run_keybase
ENTRYPOINT ["/bin/bash", "-c"]
