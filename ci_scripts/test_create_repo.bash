#!/usr/bin/env bash
set -e


source /opt/ros/$ROS_DISTRO/setup.bash
source ~/colcon_ws/install/setup.bash
cd ~/colcon_ws/src
rosrun flexbe_widget create_repo test
cd ~/colcon_ws
colcon build
source ~/colcon_ws/install/setup.bash
