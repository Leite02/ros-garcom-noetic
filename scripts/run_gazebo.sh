#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash
source /root/garcom_ws/devel/setup.bash

export DISPLAY=${DISPLAY:-:0}
export QT_X11_NO_MITSHM=1
export LIBGL_ALWAYS_SOFTWARE=1

roslaunch garcom_gazebo restaurante_garcom.launch
