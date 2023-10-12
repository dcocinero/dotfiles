#!/bin/bash


case $1 in
    ubuntu | debian | kali)
      git clone "https://github.com/gabrielelana/awesome-terminal-fonts.git" 
      bash "$(pwd)/awesome-terminal-fonts/install.sh"
      rm -rf "awesome-terminal-fonts"

      curl -OL https://github.com/ryanoasis/nerd-fonts/lastest/releases/download/UbuntuMono.tar.xz
      tar -xvf "UbuntuMono.tar.xz -C "$(pwd)/fonts/"
      rm -rf "UbuntuMono".tar.xz" 
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