FROM steamcmd/steamcmd:latest AS downloader
COPY lib/update_zomboid.txt /update_zomboid.txt
RUN mkdir -p /opt/pzserver/
RUN steamcmd +runscript /update_zomboid.txt

FROM debian:trixie-slim
RUN apt-get update && apt-get upgrade -y && apt-get install -y ca-certificates
COPY --from=downloader /opt/pzserver/ /opt/pzserver/
RUN useradd -m zombie && chown -R zombie:zombie /opt/pzserver/
USER zombie
WORKDIR /opt/pzserver
ENTRYPOINT ["/bin/bash", "-c", "/opt/pzserver/start-server.sh"]