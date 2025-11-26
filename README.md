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

#### Download client binaries from Github and run them

On the page https://github.com/Falafel-Open-Games/tabletop/releases/tag/latest you can find the Linux and HTML clients for the multiplayer game. This page will always have the latest binaries generated from the main branch.

Once downloaded you can decompress the client files to a folder with:

```
tar -xzf tabletop-linux-client.tar.gz
```

And then instantiate multiple clients on linux by running the command below on different terminal windows:

```
./tabletop.x86_64
```

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

