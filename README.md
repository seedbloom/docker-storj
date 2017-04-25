![Seedbloom, seeding the decentralised](https://avatars3.githubusercontent.com/u/28005063?v=3&s=200)

Seeding the decentralised economy

[![Docker Repository on Quay](https://quay.io/repository/seedbloom/storjshare-daemon/status "Docker Repository on Quay")](https://quay.io/repository/seedbloom/storjshare-daemon)

# Dockerized Storj Share Daemon
[Dockerized Daemon + CLI](https://github.com/Storj/storjshare-daemon) for farming data on the [Storj](https://storj.io) network, suitable for standalone use or inclusion in other packages.

The founders of [Seedbloom](https://seedbloom.it) have been supporters of [Storj](https://storj.io) from its inception. Seedbloom platform supports the network by providing
[farmer](https://storj.io/faq.html#faq-3-2) nodes. This support is reciprocated by
the Storj network rewarding Seedbloom platform with [SJCX](https://storj.io/faq.html#faq-6-1), which contributes to covering Seedbloom's
operating costs.

[Seedbloom](https://seedbloom.it), seeding the decentralised economy and building the decentralised web.
## Generate farmer key
TODO
## Create configuration
Basic configuration
```bash
docker run -it -v $(PWD)/storj-config:/root/.storj seedbloom/storjshare-daemon  create --sjcx 1Ej9gpAxtEKPmPmW2qzz2GQUJima2phLJk --size [1GB, 1TB] --storage [path to storage]  --noedit -o [path to config]
```
The storj configuration will be available in your current dir under ```storj-config```.
## Run
Start a farmer node.
```bash
docker run -v [host storage location]:[same path defined in storj config] -v [storj config absolute path]:[same path defined in storj config] seedbloom/storjshare-daemon -c [same path defined in storj config]
```
## Repositories

```bash
docker pull quay.io/seedbloom/storjshare-daemon
```

```bash
docker pull seedbloom/storjshare-daemon
```
