#!/bin/bash
mkdir -p /tmp/pupil_tmp

apptainer exec -e \
  -B /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
  -B /tmp/.X11-unix:/tmp/.X11-unix \
  -B ${XAUTHORITY}:${XAUTHORITY} \
  -B /tmp/pupil_tmp:/src/pupil/recordings \
  -B /tmp/pupil_tmp:/src/pupil/capture_settings \
  --env XAUTHORITY=$XAUTHORITY \
  --env DISPLAY=$DISPLAY \
  --env PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
  --env PULSE_COOKIE=$HOME/.config/pulse/cookie \
  --nv \
  $@
