FROM debian:latest

MAINTAINER RetroME < retro64xyz@gmail.com >

ENV KEYBASE_VERSION 1.0

RUN  apt-get -qq update
RUN	 apt-get -qq  install curl fuse libappindicator-dev -y
RUN curl -O https://prerelease.keybase.io/keybase_amd64.deb
RUN	dpkg -i keybase_amd64.deb
RUN	apt-get install -f
RUN	run_keybase

CMD ["/bin/bash"]
