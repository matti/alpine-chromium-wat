FROM alpine:edge

# picom mesa-dri-gallium \
RUN apk add --no-cache \
  xvfb x11vnc

RUN apk add --no-cache \
  chromium

RUN apk add --no-cache \
  bash

RUN apk add --no-cache \
  xeyes

WORKDIR /app
COPY app .

ENV DISPLAY=:0
ENTRYPOINT [ "/app/entrypoint.sh" ]
