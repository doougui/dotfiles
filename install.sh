#!/usr/bin/env bash

set -e -x

if ((EUID != 0)); then
  echo >&2 "❌ Script not running as root or with sudo! Exiting..."
  exit 1
fi

apt_packages="curl"

function apt_install_base_packages {
  # shellcheck disable=SC2086
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_base_packages
