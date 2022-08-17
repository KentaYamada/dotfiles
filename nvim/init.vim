"-----------------
" init.vim
" Neovim設定
"
" Author: YamaKen
"-----------------

" 変数
source ~/.config/nvim/configs/variables.vim

" set {option}
source ~/.config/nvim/configs/options.vim

" キーマッピング
source ~/.config/nvim/configs/key-mappings.vim

" プラグイン
filetype plugin indent off

source ~/.config/nvim/plugins/jetpack.vim

filetype plugin indent on

" netrw
source ~/.config/nvim/plugins/netrw.vim
" fzf
source ~/.config/nvim/plugins/fzf.vim
