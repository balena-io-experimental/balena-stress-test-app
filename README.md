The application will run two services:

* stress-ng: To stress the systems CPU and IO.
* iperf3: To stress the networking

## stress-ng

Configuration variables:

* STRESS_CPU_NR: Number of workers to work through all CPU stress methods.
* STRESS_SYNC_FILE_NR: Number of workers to perform file data syncs.
* STRESS_CACHE_NR: Number of workers to thrash the CPU cache.
* STRESS_VM_NR: Number of workers to map/write/unmap memory
* STRESS_FILL_MEM_PERCENT: Percent of memory to map and keep writing to.

## iperf

By default both a server and a client will start. The client will try to connect to the server specified with:

* IPERF_SERVER_IPADDR: IP address of remote server

Manual extra `iperf` processes can be launched with:

```
docker run  -it --rm taoyou/iperf3-alpine -c <SERVER_IP> -tinf
```
To test a bidirectional connection do:
```
docker run  -it --rm taoyou/iperf3-alpine:latest -c <SERVER_IP> -d -tinf
```
