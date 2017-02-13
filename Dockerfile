FROM scratch

ENV HOME /opt/data

COPY caddy /caddy
VOLUME /opt/data /etc/caddy /var/log/caddy

EXPOSE 80 443

CMD ["/caddy", "--conf", "/etc/caddy/Caddyfile"]
