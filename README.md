# caddy

A minimalist [Docker](https://docker.com) image for [Caddy](https://caddyserver.com) based on [alpine linux](https://hub.docker.com/r/_/alpine/). This image doesn't includes any plugins, but can be simplest added by gitlab-ci.

This image rebuilding every week automatically and has tags by versiobs: *major*, *major.minor*, *major.minor.patch* and *latest*.

[![](https://images.microbadger.com/badges/image/aohorodnyk/caddy.svg)](https://microbadger.com/images/aohorodnyk/caddy "Get your own image badge on microbadger.com")

## Getting Started

> Be aware! If you don't bind mount the location certificates are saved to, you may hit Let's Encrypt rate [limits](https://letsencrypt.org/docs/rate-limits/) rending further certificate generation or renewal disallowed (for a fixed period)! See "Saving Certificates" below!

Create empty directories:
```sh
$ mkdir -p ./data/caddy ./logs/caddy ./etc/caddy
```

Create `Caddyfile` file in `./etc/caddy` directory and configure it use [tutorial](https://caddyserver.com/tutorial), [documentation](https://caddyserver.com/docs) or [exaples](https://github.com/caddyserver/examples).

Create default `docker-compose.yml`
```yml
version: '3.1'
services:
    caddy:
        restart: always
        image: aohorodnyk/caddy:latest
        container_name: caddy
        ports:
            - '80:80'
            - '443:443'
        volumes:
            - ./data/caddy:/opt/data:rw
            - ./logs/caddy:/var/log/caddy:rw
            - ./etc/caddy:/etc/caddy:ro
        networks:
            - web
networks:
    web:
```

Add additional image to `docker-compose.yml`
```yml
version: '3.1'
services:
    caddy:
        restart: always
        image: aohorodnyk/caddy
        container_name: caddy
        ports:
            - '80:80'
            - '443:443'
        volumes:
            - ./data/caddy:/opt/data:rw
            - ./logs/caddy:/var/log/caddy:rw
            - ./etc/caddy:/etc/caddy:ro
        networks:
            - web
    your_image:
        restart: always
        image: nginx
        container_name: your/image
        volumes:
            - ...
            - ...
        networks:
            - web
networks:
    web:
```

You can get access intarnal between containers in one network by container name, for exaple `https://caddy/`

If you have a question, [create new issue](https://github.com/aohorodnyk/docker-caddy/issues/new)
