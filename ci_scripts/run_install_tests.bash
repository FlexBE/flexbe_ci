#!/usr/bin/env bash
set -e

export PYTHONWARNINGS="ignore:setup.py install is deprecated,ignore:easy_install command is deprecated"
echo "Verifying regular install build ..."
source /opt/ros/$ROS_DISTRO/setup.bash
cd ~/colcon_ws
rm -rf install build log

echo "Colcon install build ..."
colcon build
source ~/colcon_ws/install/setup.bash
# -- No longer testing flexbe_app here given release of flexbe_webui
# ros2 run flexbe_app nwjs_install
# xvfb-run ros2 run flexbe_app run_app --offline --run-tests
echo "Running colcon tests ..."
colcon test --ctest-args tests --verbose

echo "Report colcon test results ..."
colcon test-result --all
