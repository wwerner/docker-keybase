
![Docker Build](https://img.shields.io/docker/build/wernerw/docker-keybase.svg)
![Docker Stars](https://img.shields.io/docker/stars/wernerw/docker-keybase.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/wernerw/docker-keybase.svg)
![Image Size](https://img.shields.io/microbadger/image-size/wernerw/docker-keybase.svg)
![Image Layers](https://img.shields.io/microbadger/layers/wernerw/docker-keybase.svg)

# wwerner/docker-keybase 
(originally forked from Retro64XYZ/docker-keybase)

Image on docker hub: https://hub.docker.com/r/wernerw/docker-keybase/

## Docker Image - Keybase

[Keybase.io](https://keybase.io/) is working to bring crypto to the world. You
can now install the Keybase application using docker.

You can use this container to run oneshot keybase devices within your CI pipeline, thus giving it access to encrypted keybase git repos.

Please note that ATM, this is a pretty large image. Working on that.

## How to use

[Keybase docs](https://keybase.io/docs/command_line) are available from Keybase.

To check out an encrypted keybase git repository you need the following:
* A keybase user w/ a paperkey
* A keybase git repo the user has access to

You can e.g. use this to run scripts using credentials / keys stored in a keybase git repository:

```
docker run -it \
    -e KEYBASE_USERNAME=<keybase user> 
    -e KEYBASE_PAPERKEY="<keybase paperkey>" 
    wernerw/docker-keybase \
    "keybase oneshot && git clone keybase://team/<keybase team>/<keybase repo> /tmp/<work dir> && /tmp/<work dir>/<script to run>"
```
