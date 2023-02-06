The application will run two services:

* stress-ng: To stress the systems CPU and IO.
* iperf3: To stress the networking

## stress-ng

The default command will run the following:

* 1 worker stressing the CPU cache
* 2 workers doing mmap/write/munmap. May trip OOM killer. Maps the 256MB default.
* 1 worker that performs data syncs across a file

## iperf

By default a server will start. The remote side needs to run a client with something like:

```
docker run  -it --rm taoyou/iperf3-alpine -c <SERVER_IP> -tinf
```
To test a bidirectional connection do:
```
docker run  -it --rm taoyou/iperf3-alpine:latest -c <SERVER_IP> -d-tinf
```
