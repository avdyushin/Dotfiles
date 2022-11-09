#!/bin/bash

symlink() {
    local source=$PWD/$1
    local target=$HOME/$1
    if [[ -f $target || -d $target ]]; then
        read -p "$target already exists. Overwrite it (y/n)?" override
        case ${override:0:1} in
            y|Y)
                if [[ ! $target -ef "/" || ! $target -ef $HOME ]]; then
                    rm $target
                fi
                ;;
            *)
                echo "[-] $target"
                echo
                continue
                ;;
        esac
    fi
    echo "[+] $source -> $target"
    echo
    ln -s $source $target
}

for f in .*
do
    case $f in
        .|..|.git|.gitconfig|.gitignore) continue;;
        *) symlink $f;;
    esac
done
