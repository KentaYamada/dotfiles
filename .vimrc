"
" My vimrc
" Written by Kenta Yamada since 2015
" GitHub [https://github.com/KentaYamada]
"

" --- 初期化 ---
autocmd!

filetype plugin indent off

set nocompatible

syntax off


" --- 定数 ---
let g:IS_WINDOWS = has('win16') || has('win32') || has('win64')
let g:IS_MAC = has('mac')


" --- Bram氏の提供する設定を無効化(Kaoriya版利用時) ---
let g:no_vimrc_example = 1


" --- Kaoriya verにデフォルトで入っているプラグイン群を無効化 ---
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


" --- NeoBundle ---
if has('vim_starting')
    "Neobundleのパスを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle "dannyob/quickfixstatus"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle 'scrooloose/nerdtree'
NeoBundle "thinca/vim-quickrun"

NeoBundle "Shougo/vimproc", {
            \ 'build': {'mac': 'make', 'linux': 'make'},
            \}

"エラー箇所のハイライティング
NeoBundleLazy "cohama/vim-hier", {
            \ 'disabled': !has('gui_running'),
            \ }

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

"C#
if has('python3')
    NeoBundleLazy 'svermeulen/omnisharp-vim', 'Python3', {
                \ 'autoload': { 'filetypes': ['cs',], },
                \ 'build': { 'windows': 'msbuild server/OmniSharp.sln',
                \            'mac':     'xbuild server/OmniSharp.sln',
                \            'unix':    'xbuild server/OmniSharp.sln',
                \ },
                \ }
else
    NeoBundleLazy 'OmniSharp/omnisharp-vim', {
                \ 'autoload': { 'filetypes': ['cs',], },
                \ 'build': { 'windows': 'msbuild server/OmniSharp.sln',
                \            'mac':     'xbuild server/OmniSharp.sln',
                \            'unix':    'xbuild server/OmniSharp.sln',
                \ },
                \ }
endif



"Required
call neobundle#end()


filetype plugin indent on
syntax enable


" --- 基本設定 ---
"カラースキーマ
set t_Co=256
set term=screen-256color-bce
let g:solarized_termtrans=256
set background=dark
colorscheme solarized

"画面表示
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set ruler

"ファイル処理
set autoread   "外部でファイルに変更された場合は自動的に読み直す
set confirm    "ファイルが保存されていない時は終了前に保存確認
set nobackup   "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない
set noundofile "ファイル保存時にバックアップファイルを作らない

"ファイル編集
set ambiwidth=double           "日本語のズレをなくす
set backspace=indent,eol,start "バックスペースで各種消せるようにする
set list  "不可視文字を表示する
set listchars=tab:>-,trail:-,nbsp:%
set fileencodings+=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,cp932 "ファイル読み込み時に合致した文字コードを指定する

"検索・置換
set hlsearch   "検索文字列をハイライト
set ignorecase "大文字、小文字を区別しない
set incsearch  "インクリメンタルサーチを行う
set smartcase  "大文字、小文字が混在した言葉で検索した場合のみ、区別して検索する
set wrapscan   "最後尾まで検索を終えたら、先頭に移って検索する

"タブ・インデント(デフォルト)
"Info: filetypeごとの設定は個別に設定する
set autoindent   "改行時に前の行のインデントを継続する
set expandtab    "タブをスペースに変換する（<->set noexpandtab）
set shiftwidth=4 "シフトオペレータやautoindentで挿入される量
set smartindent  "改行時に入力された行の末尾に合わせてインデントを増減する
set tabstop=4    "画面上でタブ文字が占める幅

"文字コード
if IS_WINDOWS
    set encoding=cp932      "エンコード
    set fileencoding=cp932  "ファイルエンコード
    set ff=dos              "改行コード(CRLF)
else
    set encoding=utf-8     "エンコード
    set fileencoding=utf-8 "ファイルエンコード
endif

"動作環境との統合関連
set clipboard=unnamed,unnamedplus "OSのクリップボードをレジスタ指定無しでヤンク、プットできるようにする
set mouse=a "マウス入力受付
set vb t_vb=
set novisualbell
set shellslash  "Windowsでもパス区切りを[/]にする
set iminsert=0  "インサートモードから抜けると自動的にIMEをoffにする

"コマンドライン
set wildmenu wildmode=list:longest,full "コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=1000  "コマンドラインの保存履歴数

"ステータスライン
"ステータスラインにファイル情報を表示
set statusline=2
let dic_line =  { 'dos': 'CRLF', 'unix': 'CR', 'mac': 'LF' }
let f = &fileformat
let s = ''

if has_key(dic_line, f)
    let s = dic_line[f]
else
    let s = 'unkwown'
endif

set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{s}]%=%c,%l%11p%%

" --- キーマッピング ---
" <ESC>連打で検索後のハイライトを消す
nnoremap <silent><ESC><ESC> :noh<CR>


" --- オートコマンド ---
" templates {{{
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
" }}}

" markdown {{{
augroup MyMarkdown
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
augroup END
"}}}

"  閉じタグ {{{
augroup AutoCloseTag
    autocmd!
    autocmd Filetype html inoremap <buffer></ </<C-x><C-o>
    autocmd Filetype htmldjango inoremap <buffer></ </<C-x><C-o>
    autocmd Filetype xml inoremap <buffer></ </<C-x><C-o>
augroup END
" }}}


" --- 各種プラグイン設定 ---
" quick-run {{{

let g:quickrun_config = {}

"}}}

" watchdogs-vim {{{
" ファイル書き込み後にシンタックスチェックを行う
" filetype別に設定が可能
" 0: 無効/1: 有効
let g:watchdogs_check_BufWritePost_enables = {
            \ "c": 1,
            \ "cpp": 1,
            \ "cs": 0,
            \ "python": 1,
            \ }

" 一定時間キー入力がなかった場合にシンタックスチェックを行う
" filetype別に設定が可能
" 0: 無効/1: 有効
let g:watchdogs_check_CursorHold_enables = {
            \ "c": 1,
            \ "cpp": 1,
            \ "cs": 0,
            \ "python": 1,
            \ }

" シンタックスチェックツール設定
let g:quickrun_config = {
            \ "watchdogs_checker/g++": {
            \   "cmdopt": "-Wall"
            \   },
            \ "watchdogs_checker/clang++": {
            \   "cmdopt": "-Wall",
            \   },
            \ "watchdogs_checker/flake8": {
            \   },
            \ }

" quickfixウィンドウを開かないようにする
" vimprocの更新時間の設定
let g:quickrun_config["watchdogs_checker/_"] = {
            \ "outputter/quickrun/open_cmd": "",
            \ "hook/close_quickfix/enable_exit": 1,
            \ "runner/vimproc/updatetime": 40,
            \ }

" :wq実行時にsyntax checkしないようにする
let g:watchdogs_check_BufWritePost_enable_on_wq = 0

" watchdogs.vimの設定を追加
call watchdogs#setup(g:quickrun_config)

"}}}


" vim-clang {{{
let g:clang_auto = 1 "neocomplete等と連携する場合は0を設定すること
let clang_targets = ['clang-3.6', 'clang-3.5', 'clang-3.4', 'clang']
let clang_formats = ['clang-format-3.6', 'clang-format-3.5', 'clang-format-3.4', 'clang-format']
for target in clang_targets
    if executable(target)
        let g:clang_exec = target
    endif
endfor
for target in clang_formats
    if executable(target)
        let g:clang_format_exec = target
    endif
endfor

"}}}


" NERDTree {{{
" 隠しファイルを表示
let NERDTreeShowHidden = 1

" ショートカットキー
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" }}}


