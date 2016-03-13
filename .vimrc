set nocompatible

"""""""""""""
"Setup plugin
"""""""""""""
if has('vim_starting')
    "Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'davidhalter/jedi-vim', {
\ 'autoload' : {
\   'filetypes' : ['python', 'python3'],
\ },
\ 'disabled' : !(has('python') || has('python3')),
\ }

"ここからプラグインを設定


call neobundle#end()

"Required
filetype plugin indent on

"If there are uninstalled bundles found on startup,
"this will convenientle prompt you to install them.
NeoBundleCheck

"画面表示の設定
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set ruler


"カーソル移動関連の設定
set backspace=indent,eol,start
set mouse=a

"ファイル処理関連の設定
set confirm
set autoread
set nobackup
set noswapfile
set nobackup

"検索／置換の設定
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
set gdefault


"タブインデントの設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4


"エンコードの設定
set encoding=utf-8
set fileencoding=utf=8

"HTMLの閉じタグ自動補完
augroup MyHTML
  autocmd!
  autocmd FileType html inoremap <buffer> </ </<C-x><C-o>
augroup END

" テンプレファイル読み込み
autocmd BufNewFile *.html 0r ~/.vim/template/html_template.html
autocmd BufNewFile *.py 0r ~/.vim/template/python_template.py

syntax on

"Color Scheme設定
syntax enable
set background=light
colorscheme solarized