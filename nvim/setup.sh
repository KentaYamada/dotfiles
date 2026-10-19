#-------------------------------------
# @file
# setup.sh
#
# @brief
# Neovimの初期セットアップスクリプト
#
# @author
# YamaKen
#
# @created
# 2022.08.22
#
# @updated
# 2026.10.19
#-------------------------------------

# シンボリックリンク解除
NVIM_DIR=~/.config/nvim
if [ -L $NVIM_DIR ]; then
    echo "[Info] シンボリックリンクが設定済のため解除します"
    unlink $NVIM_DIR
fi

# シンボリックリンク設定
CURRENT_DIR="$(cd $(dirname $0); pwd)"
echo "[Info] シンボリックリンクを設定します"
ln -s $CURRENT_DIR $NVIM_DIR

# 環境変数設定
export XDG_CONFIG_HOME=~/.config/nvim/init.vim
