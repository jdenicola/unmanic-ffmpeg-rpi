FROM linuxserver/ffmpeg:arm64v8-latest
LABEL org.opencontainers.image.authors="chemtrails"
ENV HOME_DIR=/config
RUN apt update && apt install -y python3 python3-pip
RUN python3 -m pip install unmanic==0.2.7
EXPOSE 8888/tcp
ENTRYPOINT ["/usr/bin/python3", "-m", "unmanic"]
