"
" My vimrc
" Created by Kenta Yamada
"
" Required.
" 1. Install Git.
" 2. Clone Repository [https://github.com/kentayamada/dotfiles.git]
" 3. Setup script(OSX or Ubuntu)
"

" --- Constants ---
let g:IS_WINDOWS = has('win16') || has('win32') || has('win64')
let g:IS_MAC = has('mac')


" --- Initialize ---
autocmd!
filetype plugin indent off
set nocompatible
syntax off

" Bram氏の提供する設定を無効化(Kaoriya版利用時)
let g:no_vimrc_example = 1

" Kaoriya版にデフォルトで入っているプラグイン群を無効化
if has('kaoriya')
    " $VIM/plugins/kaoriya/autodate.vim
    let plugin_autodate_disable = 1

    " $VIM/plugins/kaoriya/hz_ja.vim
    let plugin_hz_ja_disable = 1

    "$VIM/plugins/kaoriya/scrnmode.vim
    let plugin_scrmode_disable = 1

    "$VIM/plugins/kaoriya/verifyenc.vim
    let plugin_verfyenc_disable = 1

    "$VIM/plugins/kaoriya/dicwin.vim
    let plugin_dicwin_disable = 1
endif

" -- Plugins --
if has('vim_starting')
    "Neobundleのパスを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle "dannyob/quickfixstatus"
NeoBundle "thinca/vim-quickrun"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "leafgarland/typescript-vim/"
NeoBundle "scrooloose/nerdtree/"
NeoBundle "joonty/vdebug/"
NeoBundle 'Shougo/unite.vim'

NeoBundle "Shougo/vimproc", {
            \ 'build': {'mac': 'make', 'linux': 'make'},
            \}

"Python
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'autoload' : {
            \   'filetypes' : ['python', 'python3', 'djangohtml'],
            \ },
            \ 'disabled' : !(has('python') || has('python3')),
            \ }

"C/C++
NeoBundleLazy 'justmao945/vim-clang', {
            \ 'autoload': {'filetypes': ['c', 'cpp'],},
            \ }

"Required
call neobundle#end()
" Dein.vim {{{
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=/Users/kenta/.vim/bundle//repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('/Users/kenta/.vim/bundle/')
"  call dein#begin('/Users/kenta/.vim/bundle/')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('/Users/kenta/.vim/bundle//repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here:
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
"
"  " You can specify revision/branch/tag.
"  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" If you want to install not installed plugins on startup.
"if has('vim_starting') && dein#check_install()
"  call dein#install()
"endif

filetype plugin indent on
syntax enable

" }}}

" watchdogs.vim {{{
" Referenc: https://github.com/osyo-manga/vim-watchdogs/blob/master/doc/watchdogs.jax]
" 初期化
if !exists('g:quickrun_config')
    let g:quickrun_config = {}
endif


" filetype別シンタックスチェック設定
" 0: 無効/1: 有効
let g:watchdogs_check_BufWritePost_enables = {
\       'c'          : 1,
\       'cpp'        : 1,
\       'cs'         : 0,
\       'javascript' : 1,
\       'python'     : 1,
\       'php'        : 1,
\       'sh'         : 1
\}

" 一定期間キー入力がなかった場合にチェックを実行
let g:watchdogs_checker_CursorHold_enables = {
\       'c'          : 1,
\       'cpp'        : 1,
\       'cs'         : 0,
\       'javascript' : 1,
\       'python'     : 1,
\       'php'        : 1,
\       'sh'         : 1
\}

" 保存して終了した場合にシンタックスチェックを無効化
let g:watchdogs_check_BufWritePost_enable_on_wq = 0

" シンタックスチェック設定
" Note: quickrunの設定に依存
let g:quickrun_config = {
\  'watchdogs_checker/g++': {
\    'cmdopt': '-Wall -Werror'
\  },
\  'watchdogs_checker/php': {
\  }
\}

" watchdogs全体設定
" 1. シンタックスチェック実行時にquickrunウィンドウを開かせない
" 2. vimprocの更新時間設定
let g:quickrun_config['watchdogs_checker/_'] = {
\       'runner/vimproc/updatetime'       : 40,
\       'outputter/quickfix/open_cmd'     : '',
\       'hook/close_quickfix/enable_exit' : 1
\}

" Require: watchdogs.vimへ設定の追加
call watchdogs#setup(g:quickrun_config)
" }}}

" jedi-vim {{{

" PyDoc非表示
autocmd Filetype python setlocal completeopt-=preview

" }}}

" NERDTree {{{

" 隠しファイル表示
let NERDTreeShowHidden = 1

" キーマップ
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" }}}

" vdebug {{{
let g:vdebug_force_ascii = 1
" let g:vdebug_options = {
" \    "port": 9000,
" \    "server" : 'localhost',
" \    "timeout" : 20,
" \    "on_close" : 'detach',
" \    "break_on_open" : 1,
" \    "ide_key" : 'IDE_KEY',
" \    "path_maps" : {},
" \    "debug_window_level" : 0,
" \    "debug_file_level" : 0,
" \    "debug_file" : "",
" \    "watch_window_style" : 'expanded',
" \    "marker_default" : '⬦',
" \    "marker_closed_tree" : '▸',
" \    "marker_open_tree" : '▾'
" \}

" }}}


" --- Basic Settings ---
" File edit
" 外部でファイルに変更された場合は自動的に読み直す
set autoread

" ファイルが保存されていない時は終了前に保存確認
set confirm

" 各種バックアップファイル無効化
" --> *~ *.swp *.un
set nobackup
set noswapfile
set noundofile

" 日本語のズレをなくす
set ambiwidth=double

" バックスペースで各種消せるようにする
set backspace=indent,eol,start

" 不可視文字の表示
set list
set listchars=tab:>-,trail:-,nbsp:%

" 検索ワードをハイライト
set hlsearch

" 大文字、小文字を区別しない
set ignorecase

" インクリメンタルサーチ
set incsearch

" 大文字、小文字が混在した言葉で検索した場合のみ、区別して検索する
set smartcase

" 最後尾まで検索を終えたら、先頭に移って検索する
set wrapscan

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings+=utf-8,euc-jp,cp932,iso-2022-jp

" Widows CLI対応
if IS_WINDOWS
    set encoding=cp932
    set fileencoding=cp932
    set ff=dos
endif

" Tab/Indent
" Note: filetype設定は必要に応じて行う
"改行時に前の行のインデントを継続する
set autoindent

"タブをスペースに変換する（<->set noexpandtab）
set expandtab

"シフトオペレータやautoindentで挿入される量
set shiftwidth=4

"改行時に入力された行の末尾に合わせてインデントを増減する
set smartindent

"画面上でタブ文字が占める幅
set tabstop=4

" Display
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set ruler

" Statusline
" ステータスラインにファイル情報を表示
set statusline=2
let dic_line =  { 'dos': 'CRLF', 'unix': 'CR', 'mac': 'LF' }
let f = &fileformat
let s = has_key(dic_line, f) ? dic_line[f] : 'unkwown'
set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{s}]%=%c,%l%11p%%

" Color Schema
set t_Co=256
set term=screen-256color-bce
colorscheme solarized
let g:solarized_termtrans=256
set background=dark

" Utility
" OSのクリップボードをレジスタ指定無しでヤンク、プットできるようにする
set clipboard=unnamed,unnamedplus

" マウス入力受付
set mouse=a

" ビープ音無効化
set novisualbell
set vb t_vb=

" Windowsでもパス区切りを[/]にする
set shellslash

" インサートモードから抜けると自動的にIMEをoffにする
" ToDo: Macで効かないので、設定方法調べる
set iminsert=0

" コマンドライン補完の有効化
set wildmenu wildmode=list:longest,full

" コマンドライン履歴数
set history=100

" --- Key maps ---
" <ESC>連打で検索後のハイライトを消す
nnoremap <silent><ESC><ESC> :noh<CR>

" --- Auto commands ---
" テンプレートファイル読み込み
augroup MyTemplates
    autocmd!
    autocmd BufNewFile *.cs   0r $HOME/.vim/template/template.cs
    autocmd BufNewFile *.js   0r $HOME/.vim/template/template.js
    autocmd BufNewFile *.json 0r $HOME/.vim/template/template.json
    autocmd BufNewFile *.html 0r $HOME/.vim/template/template.html
    autocmd BufNewFile *php   0r $HOME/.vim/template/template.php
    autocmd BufNewFile *.py   0r $HOME/.vim/template/template.py
    autocmd BufNewFile *.xml  0r $HOME/.vim/template/template.xml
augroup END

" マークアップ言語の閉じタグ補完
augroup AutoCloseTag
    autocmd!
    autocmd Filetype html,xml inoremap <buffer></ </<C-x><C-o>
    autocmd Filetype ctp,php inoremap <buffer></ </<C-x><C-o>
    autocmd Filetype htmldjango inoremap <buffer></ </<C-x><C-o>
augroup END

augroup TypeScriptCmd
    autocmd!
    autocmd BufRead,BufNewFile *.ts set filetype=typescript
augroup END
