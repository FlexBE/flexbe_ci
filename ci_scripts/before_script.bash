#!/usr/bin/env bash
set -e

# clone required packages
cd ~/colcon_ws/src
wstool init
for rosinstall in ~/flexbe_ci/rosinstall/*.rosinstall; do
    if [ "$(basename $rosinstall .rosinstall)" == "$BASE_REPO" ]; then
        ln -s $BASE_PATH ~/colcon_ws/src/$BASE_REPO
    else
        wstool merge $rosinstall
    fi
done
wstool up
cd ~/colcon_ws
rosdep install -y --from-paths src --ignore-src --rosdistro=${ROS_DISTRO}
