"--------------------
" My vimrc
" Author:Kenta Yamada
"--------------------
syntax on
set nocompatible "vi互換ではなく、vimのデフォルト設定にする


"OS判別
let g:IS_WINDOWS = has('win16') || has('win32') || has('win64')
let g:IS_MAC = has('mac')


"-----------
"NeoBundle
"-----------
filetype plugin indent off  " bundle設定のためoffに

if has('vim_starting')
    "Neobundleのパスを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'

if !(g:IS_WINDOWS || g:IS_MAC)
    "カラースキームプラグイン
    NeoBundle 'altercation/vim-colors-solarized'
endif

NeoBundle 'scrooloose/nerdtree'
NeoBundle "thinca/vim-quickrun"
NeoBundle "osyo-manga/shabadou.vim"

"----------------------
"エラー箇所のハイライト
NeoBundle "cohama/vim-hier"

"-------------
"Syntax checker
NeoBundle "osyo-manga/vim-watchdogs"

"書き込み後にsyntax checkを実行
let g:watchdogs_check_BufWritePost_enable = 1

" filetype別に設定
"let g:watchdogs_check_BufWritePost_enables = {
"\ "cpp": 1
"\ "cs": 0
"\}


"一定時間キー入力がなかった場合にsyntax checkを実行
"buffer書き込み後、一度だけ行われる
let g:watchdogs_check_CurorHold_enable = 1

"let g:watchdogs_check_CurorHold_enables = {
"\ "cpp": 1
"\ "cs": 0
"\}

" :wq実行時にsyntax checkしないようにする
let g:watchdogs_check_BufWritePost_enable_on_wq = 0

NeoBundle "Shougo/vimproc", {
\ 'build': {
\   'mac': 'make',
\   'linux': 'make',
\ },
\}

"Python補完プラグイン
NeoBundleLazy 'davidhalter/jedi-vim', {
\ 'autoload' : {
\   'filetypes' : ['python', 'python3'],
\ },
\ 'disabled' : !(has('python') || has('python3')),
\ }


"-----------------------
"JavaScript syntax color
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}


"----------
" C/C++補完
NeoBundleLazy 'justmao945/vim-clang', {
\ 'autoload': {'filetypes': ['c', 'cpp'],},
\ }

"Clang設定
if !(g:IS_WINDOWS || g:IS_MAC)
    "Linuxの時はclang3.5
    let g:clang_exec = 'clang-3.5'
    let g:clang_format_exec = 'clang-format-3.5'
endif

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'



"Required
call neobundle#end()

"Required
filetype plugin indent on

"If there are uninstalled bundles found on startup,
"this will convenientle prompt you to install them.
"NeoBundleCheck

"---------------
"NERDTree設定

"ショートカットキー
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"---------------


"---------------
" 一般設定

"画面表示の設定
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set ruler


"ファイル処理関連の設定
set autoread   "外部でファイルに変更された場合は自動的に読み直す
set confirm    "ファイルが保存されていない時は終了前に保存確認
set nobackup   "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない
set nobackup   "ファイル保存時にバックアップファイルを作らない


"検索/置換の設定
set hlsearch   "検索文字列をハイライト
set ignorecase "大文字、小文字を区別しない
set incsearch  "インクリメンタルサーチを行う
set smartcase  "大文字、小文字が混在した言葉で検索した場合のみ、区別して検索する
set wrapscan   "最後尾まで検索を終えたら、先頭に移って検索する


"ファイル編集関連
set ambiwidth=double           "日本語のズレをなくす
set backspace=indent,eol,start "バックスペースで各種消せるようにする
set encoding=utf-8             "エンコード
set fileencoding=utf-8         "ファイルエンコード
set fileencodings+=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,cp932 "ファイル読み込み時に合致した文字コードを指定する
set list  "不可視文字を表示する
set listchars=tab:>-,trail:-,nbsp:%

"検索／置換の設定
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan


"タブ/インデントの設定
set autoindent   "
set expandtab    "タブをスペースに変換する（⇄set noexpandtab）
set shiftwidth=4 "シフトオペレータやautoindentで挿入される量
set tabstop=4    "画面上でタブ文字が占める幅


"動作環境との統合関連の設定
set clipboard=unnamed,unnamedplus "OSのクリップボードをレジスタ指定無しでヤンク、プットできるようにする
set mouse=a "マウス入力受付
set vb t_vb=
set novisualbell
set shellslash  "Windowsでもパス区切りを[/]にする
set iminsert=0  "インサートモードから抜けると自動的にIMEをoffにする


" コマンドライン設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full 
set history=1000  " コマンドラインの保存履歴数

" ステータスラインにファイル情報を表示
set statusline=2
let dic_line =  { 'dos': 'CRLF', 'unix': 'CR', 'mac': 'LF'}
let f = &fileformat
let s = ''

if has_key(dic_line, f)
    let s = dic_line[f]
else
    let s = 'unkwown'
endif

set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{s}]%=%c,%l%11p%%

"HTMLの閉じタグ自動補完
augroup MyHTML
  autocmd!
  autocmd FileType html inoremap <buffer> </ </<C-x><C-o>
augroup END

" テンプレファイル読み込み
autocmd BufNewFile *.html 0r ~/.vim/template/html_template.html
autocmd BufNewFile *.py 0r ~/.vim/template/python_template.py

" バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
" 参考URL:ずんWiki<http://www.kawaz.jp/pukiwiki/?vim#notefoot_1>
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END


"Color Scheme設定
syntax enable
set t_Co=256
set term=screen-256color-bce
let g:solarized_termtrans=256
set background=dark
colorscheme solarized
