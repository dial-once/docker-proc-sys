#!/bin/bash
if [ "${KEEPALIVE}" != "NOPE" ]; then
    echo "=> Setting keepalive"

    mkdir -p /data/net/ipv4/
    chmod 555 /data/net/ipv4

    touch /data/net/ipv4/tcp_keepalive_time
    touch /data/net/ipv4/tcp_keepalive_intvl
    touch /data/net/ipv4/tcp_keepalive_probes

    ls /data/net/ipv4

    IFS=',' read -ra arr <<< "$KEEPALIVE"
    echo "${arr[0]}" > /data/net/ipv4/tcp_keepalive_time
    echo "${arr[1]}" > /data/net/ipv4/tcp_keepalive_intvl
    echo "${arr[2]}" > /data/net/ipv4/tcp_keepalive_probes
fi

if [ "${HUGEPAGE}" != "NOPE" ]; then
    cp /scripts/transparent-hugepage.sh /data/etc/rc.d/disable-transparent-hugepages
    chmod 755 /data/etc/rc.d/disable-transparent-hugepages
    ls /data/etc/rc.d/
    cat /data/etc/rc.d/disable-transparent-hugepages
fi
