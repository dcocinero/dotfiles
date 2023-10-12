config_file="$HOME/.config"

if ! [ -d "$config_file/config-backcup" ]; then
  mkdir -p "$config_file/config-backcup"
fi

verify_dir(){
  if [ -d "$config_file/$1" ]; then
    mv "$config_file/$1" "$config_file/config-backup/${1}bak"
  fi
}

echo "[⌛] - Installing dependencies for rofi..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install papirus-icon-theme
      echo "[⟳] - Module of updates break in debian base distros..."
    ;;
    arch)
      sudo pacman -S papirus-icon-theme
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
esac


echo "[✅] - Dependencies for rofi installed."

echo "[⌛] - Installing rofi..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install rofi
    ;;
    arch)
      sudo pacman -S rofi
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
echo "[✅] - Installed rofi."

echo ""

echo "[⌛] - Setting up rofi..."
echo "[⚠️] - Warning!!! This script removes your actual configuration, do you want to make a backup and continue?    (y/N): "
read -r back3

if [[ $back3 = "y" || $back3 == "Y" ]]; then
  verify_dir "rofi"
  cp "$(pwd)/dots/rofi"  "$config_file/rofi"
else
  echo "[❌] Stopping script. Bye. "
  exit 0
fi
echo "[✅] - Finished..."