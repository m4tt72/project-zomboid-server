FROM cm2network/steamcmd AS downloader
RUN bash ./steamcmd.sh +@sSteamCmdForcePlatformType linux +force_install_dir /home/steam/server +login anonymous +app_update 380870 +quit

FROM debian:trixie-slim
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ca-certificates
RUN useradd -m zombie
USER zombie
COPY --from=downloader /home/steam/server /home/zombie/server
WORKDIR /home/zombie/server
CMD ["./start-server.sh"]
