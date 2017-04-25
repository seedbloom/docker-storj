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
docker run -it -v $(PWD)/storj-config:[path to config] seedbloom/storjshare-daemon  create --sjcx [YOUR SJCX ADDRESS] --size [1GB, 1TB] --storage [path to storage]  --noedit -o [path to config]
```
### Example config
```
{
  // Set the SJCX/BTC address for receiving contract payments
  "paymentAddress": "[YOUR SJCX ADDRESS]",
  // Subscribes to the given contract topics
  // See https://storj.github.io/core/tutorial-contract-topics.html
  "opcodeSubscriptions": [
    "0f01020202",
    "0f02020202",
    "0f03020202"
  ],
  // Limits the number of pending OFFER message at one time
  "maxOfferConcurrency": 3,
  // If the seedList is empty, use this bridge to discover seeds
  // Following a transfer, also send an exchange report to this bridge
  "bridgeUri": "https://api.storj.io",
  // Known preferred seeds in form of a storj URI
  // Example: "storj://[ip.or.hostname]:[port]/[nodeid]"
  "seedList": [],
  // Interface to bind RPC server, use 0.0.0.0 for all interfaces or if you
  // have a public address, use that, else leave 127.0.0.1 and Storj Share
  // will try to determine your address
  "rpcAddress": "127.0.0.1",
  // Port to bind for RPC server, make sure this is forwarded if behind a
  // NAT or firewall - otherwise Storj Share will try to punch out
  "rpcPort": 4000,
  // Enables NAT traversal strategies, first UPnP, then reverse HTTP tunnel
  // if that fails. Disable if you are public or using dynamic DNS
  "doNotTraverseNat": false,
  // Maximum number of tunnels to provide to the network
  // Tunnels help nodes with restrictive network configurations participate
  "maxTunnels": 3,
  // Maximum number of concurrent connections to allow
  "maxConnections": 150,
  // If providing tunnels, the starting and ending port range to open for
  // them
  "tunnelGatewayRange": {
    "min": 4001,
    "max": 4003
  },
  // Number of times to retry joining the network and the wait time between
  "joinRetry": {
    "times": 3,
    "interval": 5000
  },
  // Temporarily stop sending OFFER messages if more than this number of shard
  // transfers are active
  "offerBackoffLimit": 4,
  // ECDSA private key for your network identity, your Node ID is derived from
  // this and it is used to sign and verify messages
  "networkPrivateKey": "d43245XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX69",
  // Determines how much detail is shown in the log:
  // 4 - DEBUG | 3 - INFO | 2 - WARN | 1 - ERROR | 0 - SILENT
  "loggerVerbosity": 3,
  // Path to write the log file to disk, leave empty to default to:
  // $HOME/.config/storjshare/logs/[nodeid].log
  "loggerOutputFile": "/var/logs/storj",
  // Directory path to store contracts and shards
  "storagePath": "/data/storj",
  // Amount of space to lease to the network, as human readable string
  // Valid units are B, KB, MB, GB, TB
  "storageAllocation": "1TB",
  // Periodically report your used and free capacity to Storj Labs to improve
  // the network - no personally identifiable information is sent
  "enableTelemetryReporting": true
}
```
The above storj configuration will be available in your current dir under ```storj-config```.
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
