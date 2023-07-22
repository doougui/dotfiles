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

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "🔤 Installing zsh-autosuggestions..."

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "🔧 Configuring Zsh..."

mv ${HOME}/.zshrc ${HOME}/.zshrc.bkp
mv ${HOME}/.zsh_history ${HOME}/.zsh_history.bkp

files_to_link=(".zshrc", ".zsh_history")

function link_dotfiles {
  for file in ${files_to_link[@]}; do
    ln -sv ${HOME}/.dotfiles/zsh/${file} ${HOME}
  done
}

link_dotfiles

echo "👩‍💻 End of Zsh installation!"

exit 0
