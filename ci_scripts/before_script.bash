#!/usr/bin/env bash
set -e

# clone required packages
cd ~/colcon_ws
for rosinstall in ~/flexbe_ci/rosinstall/*.rosinstall; do
    if [ "$(basename $rosinstall .rosinstall)" == "$BASE_REPO" ]; then
        ln -s $BASE_PATH ~/colcon_ws/src/$BASE_REPO
    else
        vcs import src < $rosinstall --workers=1
    fi
done
vcs pull src
rosdep install -y --from-paths src --ignore-src --rosdistro=${ROS_DISTRO}
