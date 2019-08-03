#!/bin/sh

grep -v "#" ~/.config/emoji | dmenu -i -l 20 -fn Hack | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
notify-send "Clipboard" "$(xclip -o -selection clipboard) copied to clipboard"
