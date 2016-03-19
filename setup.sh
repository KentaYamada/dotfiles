#!/bin/sh

#--------------------
# My setup script
# Author:Kenta Yamada
#--------------------




#シンボリックリンク作成
#gitリポジトリは全て「~/git/」にて管理
if [ ! -e ~/git/ ]; then
    mkdir ~/git/
    cd ~/git
    echo "create directory."
fi


# dotfiles ダウンロード
git clone "https://github.com/KentaYamada/dotfiles.git"

if [ $? == 0 ]; then
    cd ~/git/dotfiles/.vim
    if [ ! -e ./bundle ]; then
        mkdir ./bundle
    fi
    cd ./bundle
else
    echo "git clone failed."
    exit 1
fi

# NeoBundleダウンロード
git clone "https://github.com/Shougo/neobundle.vim.git"
git submodule update --init


# ToDo:配列とループを使って実行できるようにする
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.vim ~/.vim
