#!/usr/bin/env bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash

# build packages
cd ~/colcon_ws
colcon build
source ~/colcon_ws/install/setup.bash

# TEST create repo
cd ~/colcon_ws/src
ros2 run flexbe_widget create_repo test

# TEST run ros tests
cd ~/colcon_ws
rm -rf install build log
colcon build
source ~/colcon_ws/install/setup.bash
ros2 run flexbe_app nwjs_install
xvfb-run ros2 run flexbe_app run_app --offline --run-tests
colcon test --ctest-args tests
colcon test-result --all
