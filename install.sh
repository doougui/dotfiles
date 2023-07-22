#!/usr/bin/env bash

set -e

apt_packages="wget curl"

function apt_install_base_packages {
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_base_packages

source ./git/install.sh
source ./zsh/install.sh
source ./vscode/install.sh

exit 0
