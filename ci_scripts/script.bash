#!/usr/bin/env bash
set -e

source ~/colcon_ws/install/setup.bash

# build packages
cd ~/colcon_ws
catkin build
source ~/colcon_ws/install/setup.bash

# TEST create repo
cd ~/colcon_ws/src
rosrun flexbe_widget create_repo test

# TEST run ros tests
cd ~/colcon_ws
rm -rf install build log
colcon build
source ~/colcon_ws/install/setup.bash
xvfb-run rosrun flexbe_app run_app --offline --run-tests
colcon test
colcon test-result --all
