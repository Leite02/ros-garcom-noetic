#!/usr/bin/env bash

CONTAINER_NAME="ros-garcom-noetic"
IMAGE_NAME="ros-garcom-noetic"

if [ "$(docker ps -aq -f name=^/${CONTAINER_NAME}$)" ]; then
  echo "Container já existe. Iniciando..."
  docker start -ai ${CONTAINER_NAME}
else
  echo "Criando novo container..."
  docker run -it \
    --name ${CONTAINER_NAME} \
    --privileged \
    --network host \
    -e DISPLAY=${DISPLAY:-:0} \
    -e QT_X11_NO_MITSHM=1 \
    -e LIBGL_ALWAYS_SOFTWARE=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v "$(pwd)":/root/garcom_ws \
    ${IMAGE_NAME} \
    bash
fi
