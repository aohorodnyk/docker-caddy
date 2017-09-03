FROM alpine:latest

ENV PLUGINS ""

WORKDIR /tmp

RUN apk --no-cache add ca-certificates curl jq
RUN HUGO_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r ".name" | grep -o "[0-9\.]\+" | head -1) \
    && curl -L "https://caddyserver.com/download/linux/amd64?plugins=${PLUGINS}"  | tar -xz


FROM alpine:3.6

ENV HOME /opt/data

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/* /tmp/*

COPY --from=0 /tmp/caddy /usr/bin/caddy
VOLUME /opt/data /etc/caddy /var/log/caddy

EXPOSE 80 443

CMD ["caddy", "--conf", "/etc/caddy/Caddyfile"]
