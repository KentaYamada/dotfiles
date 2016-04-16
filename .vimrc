"--------------------
" My vimrc
" Author:Kenta Yamada
"--------------------



syntax on
set nocompatible "vi互換ではなく、vimのデフォルト設定にする



"-----------
"NeoBundle
"-----------
if has('vim_starting')
    "Neobundleのパスを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'

if !(has('win32') || has('mac')) 
    "カラースキームプラグイン
    NeoBundle 'altercation/vim-colors-solarized'
endif

"ファイルエクスプローラー
NeoBundle 'scrooloose/nerdtree'

"Python補完プラグイン
NeoBundleLazy 'davidhalter/jedi-vim', {
\ 'autoload' : {
\   'filetypes' : ['python', 'python3'],
\ },
\ 'disabled' : !(has('python') || has('python3')),
\ }

"ToDo:ビルド通っても補完できなかったので、とりあえずコメントアウト
"C#補完プラグイン
"NeoBundleLazy 'nosami/Omnisharp', {
"\   'autoload': {'filetypes': ['cs']},
"\   'build': {
"\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
"\     'mac': 'xbuild server/OmniSharp.sln',
"\     'unix': 'xbuild server/OmniSharp.sln',
"\   },
"\ }

" C/C++補完
NeoBundleLazy 'justmao945/vim-clang', {
\ 'autoload': {'filetypes': ['c', 'cpp'],},
\ }

"Clang実行の確認
"for i in range(6, 3, -1)
"    if executable(printf('clang-3.%d', i))
"        let g:clang_exec = ''
"    endif
"endfor

"Required
call neobundle#end()

"Required
filetype plugin indent on

"If there are uninstalled bundles found on startup,
"this will convenientle prompt you to install them.
NeoBundleCheck

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
set nobackup


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
set tabstop=4    "


"動作環境との統合関連の設定
set clipboard=unnamed,unnamedplus "OSのクリップボードをレジスタ指定無しでヤンク、プットできるようにする
set mouse=a "マウス入力受付
set vb t_vb=
set novisualbell


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


"Color Scheme設定
syntax enable
colorscheme elflord

"とりあえずLinuxの場合だけ
if !(has('win32') || has('mac')) 
    set background=light
    colorscheme solarized
endif
