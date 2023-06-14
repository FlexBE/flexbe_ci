#!/usr/bin/env bash
set -e

PYTHON=${PYTHON:-python}

# install ros 2
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt install -y dpkg # fix https://github.com/travis-ci/travis-ci/issues/10132
sudo apt install -y xvfb  # `xvfb-run` is used in scrpt.bash
sudo apt install -y ros-$ROS_DISTRO-ros-base
sudo apt install -y $PYTHON-rosinstall $PYTHON-rosinstall-generator $PYTHON-wstool ros-dev-tools $PYTHON-catkin-pkg $PYTHON-rosdep ros-$ROS_DISTRO-catkin $PYTHON-catkin-tools $PYTHON-osrf-pycommon
sudo rosdep init
rosdep update --rosdistro=${ROS_DISTRO}
