# FlexBE CI

Continuous integration for FlexBE. Happy testing!

## Github Actions Usage !

[Build Status](https://github.com/FlexBE/flexbe_ci/workflows/FlexBE%20CI/badge.svg?branch=humble)
Copy the file `.github/workflows/main.yml` into the `.github/workflows` folder of your repo and name it, e.g., `flexbe_ci.yml`.


-----


Substitute

    run: |
      ln -s $GITHUB_WORKSPACE ~/flexbe_ci
      source ~/flexbe_ci/setup.bash $ROS_DISTRO

by

    run: |
      git clone -b $BRANCH_NAME https://github.com/FlexBE/flexbe_ci.git ~/flexbe_ci
      source ~/flexbe_ci/setup.bash $ROS_DISTRO

## Travis Usage [![Build Status](https://travis-ci.org/FlexBE/flexbe_ci.svg?branch=ros2-devel)](https://travis-ci.org/FlexBE/flexbe_ci)

Copy the file `.travis.yml` into the root folder of your repo.

Substitute

    before_install:
      - ln -s $PWD ~/flexbe_ci
      - source ~/flexbe_ci/setup.bash

by

    before_install:
      - git clone -b $BRANCH_NAME https://github.com/FlexBE/flexbe_ci.git ~/flexbe_ci
      - source ~/flexbe_ci/setup.bash
