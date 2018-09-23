#!/usr/bin/env bash

export ROS_PARALLEL_JOBS='-j8'
export ROS_DISTRO=${1:-indigo}
export BASE_PATH=$PWD
export BASE_REPO=${PWD##*/}
chmod -R +x ~/flexbe_ci/ci_scripts

echo "Running build for $BASE_REPO"
