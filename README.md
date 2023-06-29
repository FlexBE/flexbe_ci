# FlexBE CI


## Github Actions Usage !

[Build Status](https://github.com/FlexBE/flexbe_ci/workflows/FlexBE%20CI/badge.svg?branch=ros2-devel)
Copy the file `.github/workflows/main.yml` into the `.github/workflows` folder of your repo and name it, e.g., `flexbe_ci.yml`.

Substitute

    run: |
      ln -s $GITHUB_WORKSPACE ~/flexbe_ci
      source ~/flexbe_ci/setup.bash $ROS_DISTRO

by

    run: |
      git clone -b $BRANCH_NAME https://github.com/FlexBE/flexbe_ci.git ~/flexbe_ci
      source ~/flexbe_ci/setup.bash $ROS_DISTRO
