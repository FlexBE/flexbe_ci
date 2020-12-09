#!/usr/bin/env bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash

# setup workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init
catkin build
