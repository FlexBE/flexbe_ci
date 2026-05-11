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

set +e
echo "Running colcon tests ..."
colcon test # \
#    --event-handlers console_direct+ \
#    --ctest-args --output-on-failure

echo "Report results ..."
colcon test-result --verbose --all
TEST_RESULT=$?
set -e

if [ $TEST_RESULT -ne 0 ]; then
    echo "Show failed package logs ..."
    find log/latest_test \( -name "*.log" -o -name "*.txt" \) | xargs grep -iE "FAILED|ERROR:" || true
fi
exit $TEST_RESULT
