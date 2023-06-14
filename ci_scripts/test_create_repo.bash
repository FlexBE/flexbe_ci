#!/usr/bin/env bash
set -e


source /opt/ros/$ROS_DISTRO/setup.bash
source ~/colcon_ws/install/setup.bash
cd ~/colcon_ws/src
ros2 run flexbe_widget create_repo test
cd ~/colcon_ws
colcon build
source ~/colcon_ws/install/setup.bash
