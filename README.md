# Project Zomboid Server - Docker

This is a Docker image for Project Zomboid server.

## Usage

### Docker

```bash
docker pull ghcr.io/m4tt72/project-zomboid-server:main

mkdir -p /srv/zomboid

cd /srv/zomboid

docker run -it -v `pwd`:/home/zombie/Zomboid ghcr.io/m4tt72/project-zomboid-server:main bash start-server.sh
```

Set the server password then run the compose file.

```
docker compose up -d
```
