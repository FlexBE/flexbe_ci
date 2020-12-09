#!/usr/bin/env bash
set -e

PYTHON=${PYTHON:-python}

# install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y dpkg # fix https://github.com/travis-ci/travis-ci/issues/10132
sudo apt install -y xvfb  # `xvfb-run` is used in scrpt.bash
sudo apt-get install -y ros-$ROS_DISTRO-ros-base
sudo apt-get install -y $PYTHON-rosinstall $PYTHON-rosinstall-generator $PYTHON-wstool build-essential $PYTHON-catkin-pkg $PYTHON-rosdep ros-$ROS_DISTRO-catkin $PYTHON-catkin-tools
sudo rosdep init
rosdep update
