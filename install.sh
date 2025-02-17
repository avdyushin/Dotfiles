#!/bin/bash

symlink() {
    local source=$PWD/$1
    local target=$HOME/$1
    echo "[+] $source -> $target"
    echo
    ln -i -s $source $target
}

for f in .*
do
    case $f in
        .|..|.git|.gitconfig|.gitignore) continue;;
        *) symlink $f;;
    esac
done
