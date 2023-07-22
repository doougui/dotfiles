#!/usr/bin/env bash

set -e

echo "📝 Installing VSCode..."

function apt_install_software {
  xdg-open https://code.visualstudio.com/download
  sleep 1
}

apt_install_software

function get_wakatime_key {
  echo "📝 Opening WakaTime API Key..."
  xdg-open https://wakatime.com/settings/api-key
}

while true; do
  read -p "🕒 Do you want to set up your WakaTime API Key? (y/n) " yn
  case "${yn}" in
    [Yy]*)
      get_wakatime_key
      break;;
    [Nn]*)
      echo "🕒 WakaTime API Key configuration was skipped!"
      break;;
  esac
done

echo "✅ VSCode has settings sync, so you don't need to install anything else."
echo "📝 End of VSCode installation!"
