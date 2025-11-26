# Multiplayer Tabletop Game

This project contains both server and client for an open-source tabletop games framework.

## Status

This is under construction and in a very early stage, things are moving a lot, better documentation will come as the project matures.

## License

MIT

## Usage

If you are a developer that wants to contribute to the project and have Godot installed, skip to the "Build the binaries" section.

### Get the binaries

#### Pull the server from Dockerhub and run it

```
podman pull docker.io/fczuardi/tabletop-server:latest
podman run -it --rm --init -p 8910:8910 -t tabletop-server:latest
```

(this repo contains CI/CD workflow to build and publish the latest version of the server to Dockerhub)


#### Download client binaries from Github and run them

TBD: not yet available, see instructions below to build them yourself


### Build the binaries

First step is to build the binaries, both the headless server and the client, you will need Godot `4.5.1-stable` for that. You can do that by opening the Godot project and Export>Export All, or via command line as displayed below:


```
alias godot=~/dev/Godot_v4.5.1-stable_linux.x86_64 # replace with your godot path
godot --headless --export-release "Linux Headless Server" build/server/tabletop_server.x86_64
godot --headless --export-release "Linux Client" build/linux-client/tabletop.x86_64
```

### Launch the server in one terminal

It's important to pass the CLI argument `--server`.

```
./build/server/tabletop_server.x86_64 --server
```

The server will communicate via websockets by default on `ws://127.0.0.1:8910`

#### Alternativelly, build the docker container and launch it instead

```
podman build -t tabletop-server:latest -f Containerfile .
podman run -it --rm --init -p 8910:8910 -t tabletop-server:latest
```

### Launch the clients on different terminals

To open a new client window on the same machine as the server, run:

```
./build/linux-client/tabletop.x86_64
```

All local clients will connect to the same local server default room, this doc will be updated once issue #6 is resolved.

