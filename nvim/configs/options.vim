"------------------------------------------------
" options.vim
" set {option} 設定
"
" Author: YamaKen
" See: https://vim-jp.org/vimdoc-ja/options.html
"------------------------------------------------

"----------
" ファイル
"----------
" 行頭の余白内でTabキーを打ち込むと、smartwidth分インデントする
"set smarttab
" エンコード設定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac


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
" vimgrepにripgrepを使う(ripgrep要インストール)
if executable("rg")
    let &grepprg = "rg --vimgrep"
    set grepformat=%f:%l%c:%m
endif
