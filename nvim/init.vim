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

" 環境別の設定
source ~/.config/nvim/configs/environment.vim

" プラグイン
filetype plugin indent off

source ~/.config/nvim/plugins/jetpack.vim

filetype plugin indent on

" fern
source ~/.config/nvim/plugins/fern.vim
" fzf
source ~/.config/nvim/plugins/fzf.vim
" lightline
source ~/.config/nvim/plugins/lightline.vim
" lsp
source ~/.config/nvim/plugins/mason.vim

" カラースキーム
source ~/.config/nvim/configs/color.vim
