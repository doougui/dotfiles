#!/usr/bin/env bash

set -e

apt_packages="curl"

function apt_install_base_packages {
  # shellcheck disable=SC2086
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_base_packages
