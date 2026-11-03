#!/bin/bash
apptainer exec -e \
  -B /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
  -B /tmp/.X11-unix:/tmp/.X11-unix \
  -B ${XAUTHORITY}:${XAUTHORITY} \
  --env XAUTHORITY=$XAUTHORITY \
  --env DISPLAY=$DISPLAY \
  $@
