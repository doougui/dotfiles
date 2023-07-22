#!/usr/bin/env bash

set -e

apt_packages="zsh"

echo "👩‍💻 Installing Zsh..."

function apt_install_packages {
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_packages

echo "👩‍💻 Installing Oh My Zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🔧 Configuring Zsh..."

files_to_link=(".zshrc", ".zsh_history")

function link_dotfiles {
  for file in ${files_to_link[@]}; do
    ln -sv ${HOME}/.dotfiles/zsh/${file} ${HOME}
  done
}

link_dotfiles

echo "👩‍💻 End of Zsh installation!"

exit 0
