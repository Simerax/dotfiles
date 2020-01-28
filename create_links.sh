#!/bin/sh
repo_path=$(dirname $(readlink -f $0))

function create_link {
    echo "$1 -> $2"
    ln -sfn $1 $2
}

# list all entries, awk the name, dont grep .git and '.' & '..' and only use stuff that starts with '.'
ls -la "$repo_path" | awk '{print $9}' | grep -P -v '^\.\.?$|^.git$' | grep '^\.' | while read file
do
    create_link "$repo_path/$file" ~/$(basename $file)
done

# .config folder
ls "$repo_path/.config" | tr " " "\n" | while read thing
do
    create_link "$repo_path/.config/$thing" ~/.config/$(basename $thing)
done

