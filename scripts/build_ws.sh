#!/usr/bin/env bash

cd /root/garcom_ws
source /opt/ros/noetic/setup.bash
catkin_make
source devel/setup.bash
