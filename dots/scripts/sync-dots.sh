#!/bin/bash

config_file="$HOME/.config"

# actual config
i3_update="$config_file/i3"
polybar_update="$config_file/polybar"
rofi_update="$config_file/rofi"
kitty_update="$config_file/kitty"
powerlevel10k_update="$config_file/powerlevel10k"


# path update
repo_file="$HOME/Desktop/dotfiles"

# update conf
rsync -av --progress "$i3_update" "$repo_file/dots/"
rsync -av --progress "$polybar_update" "$repo_file/dots/"
rsync -av --progress "$rofi_update" "$repo_file/dots/"
rsync -av --progress "$kitty_update" "$repo_file/dots/"
rsync -av --progress "$powerlevel10k_update" "$repo_file/dots/"
rsync -av --progress "$HOME/.zshrc" "$repo_file/"
rsync -av --progress "$HOME/.p10k.zsh" "$repo_file/"

echo "Update complete."
