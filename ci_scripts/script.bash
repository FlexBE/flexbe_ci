#!/usr/bin/env bash
set -e

source ~/catkin_ws/devel/setup.bash

# build packages
cd ~/catkin_ws
catkin build
source ~/catkin_ws/devel/setup.bash

# TEST create repo
cd ~/catkin_ws/src
rosrun flexbe_widget create_repo test

# TEST run ros tests
cd ~/catkin_ws
catkin build
source ~/catkin_ws/devel/setup.bash
xvfb-run rosrun flexbe_app run_app --offline --run-tests
catkin run_tests && catkin_test_results

# install packages
cd ~/catkin_ws
catkin clean --yes
catkin config --install
catkin build
source ~/catkin_ws/install/setup.bash
xvfb-run rosrun flexbe_app run_app --offline --run-tests
catkin run_tests && catkin_test_results
