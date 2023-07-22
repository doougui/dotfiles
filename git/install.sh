#!/usr/bin/env bash

set -e

apt_packages="git"

echo "🌱 Installing Git..."

function apt_install_packages {
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_packages

echo "🔧 Configuring Git..."

files_to_link=(".gitconfig")

function link_dotfiles {
  for file in ${files_to_link[@]}; do
    if [ -f "${HOME}/${file}" ]; then
      echo "📁 ${file} file already exists. Creating a backup..."
      mv ${HOME}/${file} ${HOME}/${file}.bkp
    fi

    ln -sv ${HOME}/.dotfiles/git/${file} ${HOME}
  done
}

link_dotfiles

echo "🌱 End of Git installation!"
