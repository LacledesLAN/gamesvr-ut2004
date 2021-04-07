# Unreal Tournament 2004 Dedicated Server in Docker

Unreal Tournament 2004 is a first-person shooter developed by Epic Games and Digital Extremes, first released in March 2004. Unreal Tournament 2004 features most of the content of its predecessor. Among significant changes to gameplay mechanics and visual presentation, one of the major additions introduced by Unreal Tournament 2004 is the inclusion of vehicles and the Onslaught game type, allowing for large-scale battles.

![UT2004 Screenshot](https://raw.githubusercontent.com/LacledesLAN/gamesvr-ut2004/master/.misc/screenshot1.jpg "UT2004 Screenshot")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are intended to be bare-bones and used as a stock server. For an example of building a customized server from this Docker image browse the related child-project [gamesvr-ut2004-freeplay](https://github.com/LacledesLAN/gamesvr-ut2004-freeplay). If any documentation is unclear or it has any issues please see [CONTRIBUTING.md](./CONTRIBUTING.md)

## Linux

### Download

```shell
docker pull lacledeslan/gamesvr-ut2004;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted to this repository if any tests fail.

```shell
docker run -it --rm lacledeslan/gamesvr-ut2004:latest /app/ll-tests/gamesvr-ut2004.sh;
```

### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ut2004 ./ucc-bin server DM-Gael?game=XGame.xDeathMatch -nohomedir -lanplay
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
