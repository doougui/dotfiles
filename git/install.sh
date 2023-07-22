#!/usr/bin/env bash

set -e -x

apt_packages="git"

echo "🌱 Installing Git..."

function apt_install_packages {
  # shellcheck disable=SC2086
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_packages
