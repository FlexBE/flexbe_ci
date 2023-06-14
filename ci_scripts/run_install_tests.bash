#!/usr/bin/env bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash
cd ~/colcon_ws
rm -rf install build log
colcon build
source ~/colcon_ws/install/setup.bash
ros2 run flexbe_app nwjs_install
xvfb-run ros2 run flexbe_app run_app --offline --run-tests
colcon test --ctest-args tests
colcon test-result --all
