#!/bin/bash
repo_path=$(dirname $(readlink -f $0))

function create_link {
    echo "$1 -> $2"
    ln -sfn $1 $2
}

find $repo_path -name '.*' | grep -v '.git' | while read file
do
    create_link "$file" ~/$(basename $file)
done

# i3wm config
create_link "$repo_path/i3/config" ~/.config/i3/config

