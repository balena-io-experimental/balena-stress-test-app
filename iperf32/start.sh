#!/bin/sh

iperf3 -s &

cmd="iperf3 -c ${IPERF_SERVER_IPADDR} -d -tinf &"
if [ -n "${IPERF_SERVER_IPADDR}" ]; then
	until ${cmd}; do
			sleep 5
	done
fi

while true; do sleep 10; done
