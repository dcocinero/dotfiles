#!/bin/bash


case $1 in
    ubuntu | debian | kali)
      sudo apt install awesome-terminal-fonts ttf-ubuntu-mono-nerd
    ;;
    arch)
      sudo pacman -S awesome-terminal-fonts ttf-ubuntu-mono-nerd
    ;;
    *)
      echo "[❌] - Unsupported OS"
    ;;
esac

FONT_DIR="$HOME/.local/share/fonts"

if ! [ -d "$FONT_DIR" ]; then
  mkdir -p "$FONT_DIR"
fi

cp "$(pwd)/fonts"/*  "$FONT_DIR"