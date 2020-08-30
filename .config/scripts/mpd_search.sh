#!/bin/sh

theme=~/.config/rofi/themes/flat-orange.rasi

songs=$(rofi -dmenu -theme $theme | xargs -I{} mpc -f "%artist% - %title% <%file%>" search any \"{}\")


if [ -n "$songs" ]
then
    selected_song=$(echo "$songs" | rofi -dmenu -i -theme $theme | perl -pe 's/.*<(.*)>.*/$1/g')
    if [ -n "$selected_song" ]
    then
        mpc insert $selected_song
        mpc next
        mpc play
    fi
fi
