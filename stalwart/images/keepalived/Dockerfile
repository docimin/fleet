# keepalived for the Stalwart floating mail IPs. Built and pushed by hand:
#   docker build -t harbor.fayevr.dev/fleet/keepalived:2.3.1 stalwart/images/keepalived
#   docker push harbor.fayevr.dev/fleet/keepalived:2.3.1
FROM alpine:3.22
RUN apk add --no-cache keepalived curl
ENTRYPOINT ["/bin/sh", "/etc/keepalived-start/start.sh"]
