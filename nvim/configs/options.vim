" ------------------
" options.vim
" set {option} 設定
"
" Author: YamaKen
" See: https://vim-jp.org/vimdoc-ja/options.html
" ------------------

"----------
" カーソル
"----------
" カーソル行の表示
set cursorline
" 画面右下にカーソル位置を表示
set ruler

"------
" 表示
"------
" 行番号の表示
set number
" カッコにカーソルがあたっている場合、対応するカッコを強調表示
set showmatch
" 不可視文字を表示
set list
" 不可視文字の表示に使う文字を設定
set listchars=tab:>-,trail:-,nbsp:%
" カラースキーム (default)
set background=dark
colorscheme desert
" ステータスラインを常に表示
" (0: never, 1: more than two windows, 2: always)
set laststatus=2
" 画面最下部のメッセージ表示行数
set cmdheight=2
" コマンド表示
set showcmd

"----------
" ファイル
"----------
" 編集中のファイルがvim外部で変更された場合、自動的にリロード
set autoread
" 保存されていないファイルがあるときに保存の確認をする
set confirm
" ディレクトリの区切り文字をスラッシュにする(for Windows)
set shellslash
" 曖昧幅の解消
set ambiwidth=double
" スペースのインデント
set expandtab
" インデント幅
set tabstop=4
" 自動インデント幅
set shiftwidth=4
" 改行時に前の行のインデントを継続
set autoindent
" 改行したときに次の行を自動的にインデントする
set smartindent
" 行頭の余白内でTabキーを打ち込むと、smartwidth分インデントする
set smarttab
" エンコード設定
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac
" バックアップファイルを作成しない
set nobackup
set nowritebackup
" スワップファイルを作成しない
set noswapfile

"-----------
" 検索/置換
"-----------
" ハイライトサーチ
set hlsearch
" インクリメンタルサーチ
set incsearch
" 検索時に大文字、小文字を区別しない (fuzzy)
set ignorecase
" 検索文字列に大文字、小文字が混在した場合は、区別して検索
set smartcase
" 検索候補の最後尾にたどり着いたら先頭へ戻る
set wrapscan

"----------------
" ウィンドウ操作
"----------------
" 水平方向へ分割する場合、下に開くようにする
set splitbelow

"---------------
" コマンドライン
"---------------
set wildmenu

"--------
" OS操作
"--------
" クリップボード設定
set clipboard=unnamed,unnamedplus
" マウス無効化
set mouse=
" バックスペースキーによる削除を有効化
set backspace=indent,eol,start
" ビープ音を鳴らさないようにする
set vb t_vb=
" ビープ音を可視化しない
set novisualbell

"--------
" その他
"--------
" 履歴の保持数
set history=50
" vimgrepにripgrepを使う(ripgrep要インストール)
if executable("rg")
    let &grepprg = "rg --vimgrep"
    set grepformat=%f:%l%c:%m
endif
