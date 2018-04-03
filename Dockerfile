FROM alpine:latest

ENV PLUGINS ""

WORKDIR /tmp

RUN apk --no-cache add ca-certificates curl
RUN curl -L "https://caddyserver.com/download/linux/amd64?plugins=${PLUGINS}&license=personal" | tar -xz


FROM alpine:latest

ENV HOME /opt/data

RUN apk --no-cache add ca-certificates

COPY --from=0 /tmp/caddy /usr/bin/caddy
VOLUME /opt/data /etc/caddy /var/log/caddy

EXPOSE 80 443

CMD ["caddy", "--conf", "/etc/caddy/Caddyfile"]
