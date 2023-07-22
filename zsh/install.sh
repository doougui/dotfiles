#!/usr/bin/env bash

set -e

apt_packages="zsh"

echo "👩‍💻 Installing Zsh..."

function apt_install_packages {
  sudo apt-get update && sudo apt-get install -y ${apt_packages}
}

apt_install_packages

echo "👩‍💻 Installing Oh My Zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "🎭 Installing spaceship Zsh theme..."

zsh_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${zsh_path}/themes/spaceship-prompt" --depth=1
ln -s "${zsh_path}/themes/spaceship-prompt/spaceship.zsh-theme" "${zsh_path}/themes/spaceship.zsh-theme"

echo "🔤 Installing zsh-autosuggestions..."

git clone https://github.com/zsh-users/zsh-autosuggestions ${zsh_path}/plugins/zsh-autosuggestions

echo "🔧 Configuring Zsh..."

if [ -f ${HOME}/.zshrc ]; then
  echo "📁 .zshrc file already exists. Creating a backup..."
  mv ${HOME}/.zshrc ${HOME}/.zshrc.bkp
fi

if [ -f ${HOME}/.zsh_history ]; then
  echo "📁 .zsh_history file already exists. Creating a backup..."
  mv ${HOME}/.zsh_history ${HOME}/.zsh_history.bkp
fi

files_to_link=(".zshrc", ".zsh_history")

function link_dotfiles {
  for file in ${files_to_link[@]}; do
    ln -sv ${HOME}/.dotfiles/zsh/${file} ${HOME}
  done
}

link_dotfiles

echo "👩‍💻 End of Zsh installation!"

exit 0
