#!/usr/bin/env bash
set -euo pipefail

(
  exec Xvfb :0 \
    -screen 0 "1366x768x24" \
    -ac -listen tcp -nocursor -br
) &

(
  while true; do
    set +e
      x11vnc \
          -listen 0.0.0.0 \
          -display :0 \
          -shared
    set -e
    echo "x11vnc rstart"
    sleep 1
  done
) &

(
  while true; do
    set +e
      xeyes
    set -e
    echo "xeyes restart"
    sleep 1
  done
) &

(
  while true; do
    set +e
      chromium-browser --no-sandbox
    set -e
    echo "chromium restart"
    sleep 1
  done
) &

echo "hang"
exec tail -f /dev/null