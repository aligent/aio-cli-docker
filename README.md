![Docker Pulls](https://img.shields.io/docker/pulls/aligent/aio)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/aligent/aio?sort=semver)

# Introduction

Docker image for running the aio command without requiring it to be installed. It is available on docker 
hub as [aligent/aio](https://hub.docker.com/r/aligent/aio).

## Installation

Add the following lines to your `~/.bashrc` file to be able to run it easily...

```
alias appbuilder='docker run --rm -it --volume ~/.npm:/home/node/.npm --volume "$PWD:/app" --volume ~/.config:/home/node/.config -v "/var/run/docker.sock:/var/run/docker.sock:rw" --network host aligent/aio'
alias aio='appbuilder aio'

```

You will then need to reload your bashrc file, either by running `. ~/.bashrc` or starting a new terminal session.

## Usage

You can now run aio normally.

```
aio --version
aio help 
```

