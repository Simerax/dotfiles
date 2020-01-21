#!/bin/sh

emoji=$(grep -v "#" ~/.config/emoji | rofi -dmenu | awk '{print $1}' | tr -d '\n')

if [ -z "$emoji" ]
then
    notify-send "Emoji not copied"
else
    echo $emoji | xclip -selection clipboard
    notify-send "Emoji '$(xclip -o -selection clipboard)' copied"
fi
