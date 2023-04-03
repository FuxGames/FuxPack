# FuxPack

A small Minecraft modpack very close to current Vanilla, with just a few QoL and
performance improvements.

## Installation

### Client

Download the latest Release's `FuxPackAU.zip` file and import it into Prism Launcher.

### Server

```sh
sudo docker run -d --restart=always -p 25565:25565 -v $PWD/fuxpack-server:/data -e TYPE=FABRIC -e VERSION=1.19.2 -e PACKWIZ_URL=https://raw.githubusercontent.com/FuxGames/FuxPack/main/pack.toml -e EULA=TRUE -e MEMORY=4G itzg/minecraft-server
```

You can adjust the `MEMORY=4G` part if you want to give the server more or less
RAM.
