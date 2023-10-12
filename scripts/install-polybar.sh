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

echo "[⌛] - Installing dependencies for polybar..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install redshift
      echo "[⟳] - Module of updates break in debian base distros..."
    ;;
    arch)
      sudo pacman -S redshift pacman-contrib
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
  echo "[✅] - Dependencies for polybar installed."

echo "[⌛] - Installing Polybar..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install polybar
    ;;
    arch)
      sudo pacman -S polybar
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
esac
echo "[✅] - Installed polybar."

echo ""

echo "[⌛] - Setting up polybar..."
echo "[⚠️] - Warning!!! This script removes your actual configuration, do you want to make a backup and continue?    (y/N): "
read -r removee

if [[ $removee = "y" || $removee == "Y" ]]; then
  verify_dir "polybar"
  cp -r "$(pwd)/dots/polybar"  "$config_file"
else
  echo "[❌] Stopping script. Bye. "
  exit 0
fi
echo "[✅] - Finished..."