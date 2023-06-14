#!/usr/bin/env bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash

# setup workspace
mkdir -p ~/colcon_ws/src
cd ~/colcon_ws
colcon build
