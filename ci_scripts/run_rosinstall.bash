#!/usr/bin/env bash
set -e

# clone required packages
cd ~/colcon_ws/src
wstool init
for rosinstall in ~/flexbe_ci/rosinstall/*.rosinstall; do
    REPO_INFO=(${GITHUB_REPOSITORY//\// })
    REPO_NAME=${REPO_INFO[1]}
    if [ "$(basename $rosinstall .rosinstall)" == "$REPO_NAME" ]; then
        echo "[REPO:$rosinstall] Using local repository version"
        ln -s $GITHUB_WORKSPACE ~/colcon_ws/src/$REPO_NAME
    else
        echo "[REPO:$rosinstall] Cloning via rosinstall"
        wstool merge $rosinstall
    fi
done
wstool up
cd ~/colcon_ws
rosdep install -y --from-paths src --ignore-src --rosdistro=${ROS_DISTRO}
colcon build
