repo_path=$(dirname $(readlink -f $0))


find $repo_path -name '.*' | grep -v '.git' | while read file
do
    echo "$file"
    ln -sfn "$file" ~/$(basename $file)
done
