#!/bin/bash
config_file="$HOME/.config"

if ! [ -d "$config_file/config-backcup" ]; then
  mkdir -p "$config_file/config-backcup"
fi

verify_dir(){
  if [ -d "$config_file/$1" ]; then
    mv "$config_file/$1" "$config_file/config-backup/${1}bak"
  fi
}

echo "[⌛] - Installing dependencies for kitty..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting bat lsd
      echo "[⟳] - Module of updates break in debian base distros..."
    ;;
    arch | manjaro)
      sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting bat lsd
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
esac


echo "[✅] - Dependencies for kitty installed."

echo "[⌛] - Installing kitty..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install kitty
    ;;
    arch | manjaro)
      sudo pacman -S kitty
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
echo "[✅] - Installed kitty."

echo ""

echo "[⌛] - Setting up kitty..."
echo "[⚠️] - Warning!!! This script removes your actual configuration, do you want to make a backup and continue?    (y/N): "
read -r back1

if [[ $back1 = "y" || $back1 == "Y" ]]; then
  verify_dir "kitty"
  cp -r "$(pwd)/dots/kitty"  "$config_file"
  verify_dir "powerlevel10k"
  cp -r "$(pwd)/dots/powerlevel10k" "$config_file"

  if [[ -e "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$config_file/config-backup/.zshrcbak"
  fi
  cp "$(pwd)/.zshrc" "$HOME/"

  if [[ -e "$HOME/.p10k.zsh" ]]; then
    mv "$HOME/.p10k.zsh" "$config_file/config-backup/.p10kbak"
  fi
  mv "$HOME/.p10k.zsh" "$config_file/config-backup/.p10kbak"
  cp "$(pwd)/.p10k.zsh" "$HOME/"

else
  echo "[❌] Stopping script. Bye. "
  exit 0
fi
echo "[✅] - Finished..."