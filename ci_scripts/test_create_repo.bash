#!/usr/bin/env bash
set -e


source /opt/ros/$ROS_DISTRO/setup.bash
source ~/colcon_ws/install/setup.bash
cd ~/colcon_ws/src
ros2 run flexbe_widget create_repo test --non-interactive
cd ~/colcon_ws

if ! rosdep install -y --from-paths src --ignore-src --rosdistro=${ROS_DISTRO}; then
    echo "WARNING: rosdep install failed for test repo - skipping build, removing test repo"
    rm -rf ~/colcon_ws/src/test
    exit 0
fi

colcon build
source ~/colcon_ws/install/setup.bash
