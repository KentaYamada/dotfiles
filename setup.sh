#!/bin/sh

#--------------------
# My setup script
# Author:Kenta Yamada
#--------------------




#シンボリックリンク作成
#gitリポジトリは全て「~/git/」にて管理
if [ ! -e ~/git/ ]; then
    mkdir ~/git/
fi

cd ~/git

# dotfiles ダウンロード
git clone 'https://github.com/KentaYamada/dotfiles.git'

if [ $? == 0 ]; then
    mkdir ./bundle
else
    echo "git clone failed."
    exit 1
fi

#ToDo:配列とループを使って実行できるようにする
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.vim ~/.vim
