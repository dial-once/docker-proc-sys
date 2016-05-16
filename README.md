# docker-proc-sys

## Usage

### TCP Keepalive

Use KEEPALIVE env var as `tcp_keepalive_time,tcp_keepalive_intvl,tcp_keepalive_probes`. http://tldp.org/HOWTO/TCP-Keepalive-HOWTO/usingkeepalive.html

```sh
docker run -v /proc/sys:/data -e KEEPALIVE="600,60,20" dialonce/proc-sys
```

## Usage in Docker Cloud

We recommend using this image in Docker Cloud as follows:

```yml
proc-sys:
  image: dialonce/proc-sys
  deployment_strategy: every_node
  autodestroy: always
  environment:
    - KEEPALIVE="600,60,20"
  volumes:
    - /proc/sys:/data:rw
```
