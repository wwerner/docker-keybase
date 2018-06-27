FROM debian:latest

MAINTAINER Wolfgang Werner <mail@wolfgang-werner.net>

ENV KEYBASE_VERSION 1.0

RUN adduser keybaseme
RUN apt-get -qq update
RUN apt-get -qq  install curl fuse libappindicator-dev git -y
RUN curl -O https://prerelease.keybase.io/keybase_amd64.deb
RUN dpkg -i keybase_amd64.deb; exit 0;
RUN apt-get install -fy
USER keybaseme

RUN run_keybase
CMD ["/bin/bash"]
