#!/bin/bash

DEPS=("feh" "pavucontrol" "pactl" "brightnessctl" "picom")

echo -n "Install i3-wm?   (y/N): "
read -r isi3
echo -n "Install polybar? (y/N): "
read -r isPolybar
echo -n "Install kitty?   (y/N): "
read -r isKitty
echo -n "Install rofi?    (y/N): "
read -r isRofi

. /etc/os-release

case $ID in
  ubuntu | debian | kali)
    for dep in "${DEPS[@]}"; do
      if ! [ -x "$(command -v "$dep")" ]; then
        sudo apt install "$dep" -y
      fi
    done
  ;;
  arch)
    for dep in "${DEPS[@]}"; do
      if ! [ -x "$(command -v "$dep")" ]; then
        yes | sudo pacman -S "$dep"
      fi
    done
  ;;
  *)
    echo "[❌] - Unsupported OS"
    exit 1
  ;;
esac

if [[ $isi3 = "y" || $isi3 == "Y" ]]; then
  case $ID in
    ubuntu | debian | kali)
      bash "$(pwd)/scripts/install-i3.sh" "$ID"
    ;;
    arch)
      bash "$(pwd)/scripts/install-i3.sh" "$ID"
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
fi

if [[ $isPolybar = "y" || $isPolybar == "Y" ]]; then
  case $ID in
    ubuntu | debian | kali)
      bash "$(pwd)/scripts/install-polybar.sh" "$ID"
    ;;
    arch)
      bash "$(pwd)/scripts/install-polybar.sh" "$ID"
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
fi

if [[ $isKitty = "y" || $isKitty == "Y" ]]; then
  case $ID in
    ubuntu | debian | kali)
      bash "$(pwd)/scripts/install-kitty.sh" "$ID"
    ;;
    arch)
      bash "$(pwd)/scripts/install-kitty.sh" "$ID"
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
fi

if [[ $isRofi = "y" || $isRofi == "Y" ]]; then
  case $ID in
    ubuntu | debian | kali)
      bash "$(pwd)/scripts/install-rofi.sh" "$ID"
    ;;
    arch)
      bash "$(pwd)/scripts/install-rofi.sh" "$ID"
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
  esac
fi

echo "" 
echo "Successfully installed the following:"
if [[ $isi3 = "y" || $isi3 == "Y" ]]; then
  echo "i3-wm: $(which i3)"
fi

if [[ $isPolybar = "y" || $isPolybar == "Y" ]]; then
  echo "polybar: $(which polybar)"
fi

if [[ $isKitty = "y" || $isKitty == "Y" ]]; then
  echo "kitty: $(which kitty)"
fi

if [[ $isRofi = "y" || $isRofi == "Y" ]]; then
  echo "rofi: $(which rofi)"
fi

sh "$(pwd)/scripts/install-fonts.sh" "$ID"

echo "[✅] - Installation done."
echo "   Restart your pc!"