#!/usr/bin/env bash
set -e

source ~/colcon_ws/devel/setup.bash
cd ~/colcon_ws
rm -rf install build log
colcon build
source ~/colcon_ws/install/setup.bash
xvfb-run ros2 run flexbe_app run_app --offline --run-tests
colcon test run_tests
colcon test-result --all
