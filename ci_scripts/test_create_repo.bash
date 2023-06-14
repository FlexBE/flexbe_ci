#!/usr/bin/env bash
set -e

source ~/colcon_ws/install/setup.bash
cd ~/colcon_ws/src
rosrun flexbe_widget create_repo test
cd ~/colcon_ws
colcon build
