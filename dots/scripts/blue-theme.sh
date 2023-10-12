#!/bin/bash

# path of i3 config
config_file_i3="$HOME/.config/i3/config"

# focused colors i3
border_color_focused="#283593"
background_color_focused="#283593"
text_color_focused="#FFFFFF"

 
# replace color i3
sed -i 's/^client\.focused.*/'"client.focused          $border_color_focused $background_color_focused $text_color_focused/" "$config_file_i3"


#path of poly
config_file_poly="$HOME/.config/polybar/colors.ini"

# colors poly
principal_color="#3949ab"
second_color="#673ab7"

# replace color poly
sed -i 's/^principal =.*/'"principal = $principal_color/" "$config_file_poly"
sed -i 's/^second =.*/'"second = $second_color/" "$config_file_poly"

# feh change background
sed -i 's/^exec_always --no-startup-id feh --bg-fill ~\/Pictures\/wallpaper-.*/exec_always --no-startup-id feh --bg-fill ~\/Pictures\/wallpaper-blue.png/' "$config_file_i3"

i3-msg restart