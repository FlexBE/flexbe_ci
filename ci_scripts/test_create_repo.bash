#!/usr/bin/env bash
set -e

source ~/catkin_ws/devel/setup.bash
cd ~/catkin_ws/src
rosrun flexbe_widget create_repo test
cd ~/catkin_ws
catkin build
