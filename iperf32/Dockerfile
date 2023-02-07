FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO /bin/iperf3 https://github.com/userdocs/iperf3-static/releases/latest/download/iperf3-arm32v7 && chmod 700 /bin/iperf3
COPY start.sh /start.sh
RUN chmod 700 /start.sh

# Expose the default iperf3 server port
EXPOSE 5201

ENTRYPOINT ["/start.sh"]

