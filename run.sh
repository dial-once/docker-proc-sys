#!/bin/bash
if [ "${KEEPALIVE}" != "**None**" ]; then
    echo "=> Setting keepalive"

    mkdir -p /data/net/ipv4/
    chmod 555 /data/net/ipv4

    touch /data/net/ipv4/tcp_keepalive_time
    touch /data/net/ipv4/tcp_keepalive_intvl
    touch /data/net/ipv4/tcp_keepalive_probes

    chmod 544 /data/net/ipv4/tcp_keepalive_time
    chmod 544 /data/net/ipv4/tcp_keepalive_intvl
    chmod 544 /data/net/ipv4/tcp_keepalive_probes

    ls /data/net/ipv4

    IFS=',' read -ra arr <<< "$KEEPALIVE"
    echo "${arr[0]}" > /data/net/ipv4/tcp_keepalive_time
    echo "${arr[1]}" > /data/net/ipv4/tcp_keepalive_intvl
    echo "${arr[2]}" > /data/net/ipv4/tcp_keepalive_probes
fi
