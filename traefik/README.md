# Traefik Config

> Reverse proxy build by traefik, with ssl config

## Before you start

### SSL key

```bash
touch acme.json
chmod 600 acme.json
```

or run: `./init.sh`

### Create user

Create user by `htpasswd -nb <user> <pwd>` and put it in `traefik.toml`'s user array.

## Run

```bash
docker-compose up -d
```

## Client for test

```yml
version: '3'

services:
  whoami:
    image: containous/whoami
    restart: always
    network_mode: bridge
    labels:
      - "traefik.enable=true"
      - "traefik.frontend.rule=Host:whoami.example.com"
      - "traefik.frontend.entryPoints=http,https"
      - "traefik.frontend.redirect.entryPoint=https"
```

## Ref

- <https://blog.birkhoff.me/serve-traefiks-internal-dashboard-behind-traefik/>
- <https://blog.wu-boy.com/2019/01/deploy-service-using-traefik-and-docker/>
- <https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-18-04>

## TDOD

**Update to 2.0**
