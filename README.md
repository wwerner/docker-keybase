# retro64xyz/docker-keybase

## Docker Image - Keybase

[Keybase.io](https://keybase.io/) is working to bring crypto to the world. You
can now install the Keybase application using docker.

## How to use

[Keybase docs](https://keybase.io/docs/command_line) are available from Keybase.

### From Github

1. git clone git@github.com:Retro64XYZ/docker-keybase.git docker-keybase

2. cd docker-keybase

3. docker build -t my_keybase .

4. docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro my_keybase

### From hub.docker.com

1. docker pull retro64xyz/docker-keybase

2. docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro retro64xyz/docker-keybase
