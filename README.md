
[![Docker Build](https://img.shields.io/docker/build/wernerw/docker-keybase.svg)](https://hub.docker.com/r/wernerw/docker-keybase/builds/)
[![Docker Stars](https://img.shields.io/docker/stars/wernerw/docker-keybase.svg)](https://hub.docker.com/r/wernerw/docker-keybase/)
[![Docker Pulls](https://img.shields.io/docker/pulls/wernerw/docker-keybase.svg)](https://hub.docker.com/r/wernerw/docker-keybase/)
[![Image Size](https://img.shields.io/microbadger/image-size/wernerw/docker-keybase.svg)](https://microbadger.com/images/wernerw/docker-keybase)
[![Image Layers](https://img.shields.io/microbadger/layers/wernerw/docker-keybase.svg)](https://microbadger.com/images/wernerw/docker-keybase)


# wwerner/docker-keybase 

Image on docker hub: https://hub.docker.com/r/wernerw/docker-keybase/

(originally forked from Retro64XYZ/docker-keybase)

## Docker Image - Keybase

[Keybase.io](https://keybase.io/) is working to bring crypto to the world. You
can now install the Keybase application using docker.

You can use this container to run oneshot keybase devices within your CI pipeline, thus giving it access to encrypted keybase git repos.

It supports Java builds using Maven and .NET builds if you additionally install .NET using the official installer script (see https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script).
Java & .NET dependencies are separate layers, so they are easy to remove if you don't need them.

We use it to build and publish Java libraries to the official Maven repository and .NET packages to Nuget, using credentials / certificates from a keybase repository.


Please note that ATM, this is a pretty large image. Working on that.

## How to use

[Keybase docs](https://keybase.io/docs/command_line) are available from Keybase.

Usage requires ... 
* ... a keybase user w/ a paperkey
* ... a keybase git repo the user has access to

You can e.g. use this to run scripts using credentials / keys stored in a keybase git repository:

```
docker run -it \
    -e KEYBASE_USERNAME=<keybase user> \
    -e KEYBASE_PAPERKEY="<keybase paperkey>" \ 
    wernerw/docker-keybase \
    "keybase oneshot && git clone keybase://team/<keybase team>/<keybase repo> /tmp/<work dir> && /tmp/<work dir>/<script to run>"
```
