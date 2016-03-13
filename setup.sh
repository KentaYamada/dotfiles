#!/bin/sh

#--------------------
# My setup script
# Author:Kenta Yamada
#--------------------




#シンボリックリンク作成
#gitリポジトリは全て「~/git/」にて管理

#ToDo:配列とループを使って実行できるようにする
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc

#ディレクトリをシンボリックリンク作成した場合、Vimがちゃんと読める？
ln -sf ~/git/dotfiles/.vim ~/.vim
