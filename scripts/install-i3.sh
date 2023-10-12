config_file="$HOME/.config"

if ! [ -d "$config_file/config-backcup" ]; then
  mkdir -p "$config_file/config-backcup"
fi

verify_dir(){
  if [ -d "$config_file/$1" ]; then
    mv "$config_file/$1" "$config_file/config-backup/${1}bak"
  fi
}

echo "[⌛] - Installing i3..."
case $1 in
    ubuntu | debian | kali)
      sudo apt install i3-wm
    ;;
    arch)
      sudo pacman -S i3-wm
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
echo "[✅] - Installed i3."

echo ""

echo "[⌛] - Setting up i3..."
echo "[⚠️] - Warning!!! This script removes your actual configuration, do you want to make a backup and continue?    (y/N): "
read -r back2

if [[ $back2 = "y" || $back2 == "Y" ]]; then
  verify_dir "i3"
  cp "$(pwd)/dots/i3"  "$config_file/i3"
else
  echo "[❌] Stopping script. Bye. "
  exit 0
fi
echo "[✅] - Finished..."
