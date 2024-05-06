# Unmanic for Raspberry Pi 4.

Docker Hub URL: https://hub.docker.com/r/chemtrails/unmanic-ffmpeg-rpi

Tested on Raspbian Lite (arm64) with Debian 11.

Uses same config files as official image, so all you need is to change image source and few extra parameters (see Example)

Version notation: Tag will use same version as unmanic version, published on [PyPI](https://pypi.org/project/unmanic/#history)

## Usage

Works exactly as base image, https://hub.docker.com/r/josh5/unmanic, but it is using ffmpeg image for arm64v8.

### Example usage using docker-compose

```
version: '3'
services:
  unmanic-ffmpeg:
    image: chemtrails/unmanic-ffmpeg-rpi:latest
    restart: unless-stopped
    privileged: true
    environment:
      - PUID=<uid>
      - PGID=<gid>
    ports:
      - 8888:8888
    volumes:
      - "/dev/video10:/dev/video10"
      - "/dev/video11:/dev/video11"
      - "/dev/video12:/dev/video12"
      - ./config:/config
      - /media/hdb/movies:/library
      - /media/hdb/unmanic-tmp:/tmp/unmanic
```

## Volumes explanation

Design note: It's mandatory to use `privileged: true` for accessing Raspberry's GPU.

| Volume | Means |
|--|--|
| /dev/video10...12 | Raspberry GPU framebuffer (Broadcomm chip) |
| /config | Config files (Same folder as official image)  |
| /library | Media library for transcoding |
| /tmp/unmanic | Temp folder for transcoding (Heavily used by unmanic/ffmpeg, it's highly recommended to point to a physical drive) |

## Where did I get images from

 - ffmpeg for arm64v8 - https://hub.docker.com/r/linuxserver/ffmpeg
 - unmanic - https://hub.docker.com/r/josh5/unmanic
