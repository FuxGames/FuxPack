# FuxPack

A small Minecraft modpack very close to current Vanilla, with just a few QoL and
performance improvements.

## Servers

You're free to do whatever you like, but we'd suggest you use Docker to setup a
server like this:

```sh
mkdir -p fuxpack-server/mods
curl -Lo fuxpack-server/mods/lithium-0.10.0.jar https://mediafilez.forgecdn.net/files/4034/401/lithium-fabric-mc1.19.2-0.10.0.jar
curl -Lo fuxpack-server/mods/NoChatReports-1.13.9.jar https://mediafilez.forgecdn.net/files/4022/522/NoChatReports-FABRIC-1.19.2-v1.13.9.jar
curl -Lo fuxpack-server/mods/RoughlyEnoughItems-9.1.550.jar https://mediafilez.forgecdn.net/files/4010/364/RoughlyEnoughItems-9.1.550.jar
curl -Lo fuxpack-server/mods/architectury-6.2.46.jar https://mediafilez.forgecdn.net/files/3984/16/architectury-6.2.46-fabric.jar
curl -Lo fuxpack-server/mods/fabric-api-0.64.0.jar https://mediafilez.forgecdn.net/files/4033/180/fabric-api-0.64.0%2B1.19.2.jar
curl -Lo fuxpack-server/mods/cloth-config-8.2.88.jar https://mediafilez.forgecdn.net/files/3972/420/cloth-config-8.2.88-fabric.jar
sudo docker run -d --restart=always -p 25565:25565 -v $PWD/fuxpack-server:/data -e TYPE=FABRIC -e VERSION=1.19.2 -e EULA=TRUE -e MEMORY=4G itzg/minecraft-server
```

You can adjust the `MEMORY=4G` part if you want to give the server more or less
RAM.
