repo_path=$(dirname $(readlink -f $0))

ln -s "$repo_path/.vimrc" ~/.vimrc
ln -s "$repo_path/.tmux.conf" ~/.tmux.conf
ln -s "$repo_path/.bash_aliases" ~/.bash_aliases
ln -s "$repo_path/.quassel" ~/.quassel

