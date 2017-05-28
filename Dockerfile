FROM alpine:3.6

ENV HOME /opt/data

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/* /tmp/*

COPY caddy /caddy
VOLUME /opt/data /etc/caddy /var/log/caddy

EXPOSE 80 443

CMD ["/caddy", "--conf", "/etc/caddy/Caddyfile"]
