#!/bin/sh

iperf3 -s &

if [ -n "${IPERF_SERVER_IPADDR}" ]; then
	iperf3 -c "${IPERF_SERVER_IPADDR}" -d -tinf &
fi

while true; do sleep 10; done
