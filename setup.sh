#!/bin/sh

#--------------------
# My setup script
# Author:Kenta Yamada
#--------------------

# 必要なパッケージをインストール
packages=("ibus-mozc" "sqlite3" "vim")
for pkg in ${packages[@]}
do
  sudo apt-get install $pkg
  if [ $? == 0 ] then
      echo $pkg "installed."
  fi
done

#ホームディレクトリにgitディレクトリ作成
if [ ! -e ~/git/ ]; then
    mkdir ~/git/
    cd ~/git
    echo "create directory:" $(pwd)
fi


# dotfiles ダウンロード
git clone "https://github.com/KentaYamada/dotfiles.git"


# .vimディレクトリ下にbundleディレクトリ作成(プラグイン格納用)
cd ~/git/dotfiles/.vim/
mkdir ./bundle
cd ./bundle
echo "create directry:" $(pwd)


# NeoBundleダウンロード
git clone "https://github.com/Shougo/neobundle.vim.git"
git submodule update --init


# ホームディレクトリにシンボリックリンク作成
links=(".vimrc" ".vim")
for link in links
do
  ln -sf ~git/dotfiles/$link ~/$link
done

#ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/git/dotfiles/.vim ~/.vim
