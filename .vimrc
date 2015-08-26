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
NeoBundleLazy 'davidhalter/jedi-vim', {
\ 'autoload' : {
\   'filetypes' : ['python'],
\ },
\ 'disabled' : !has('python'),
\ }
NeoBundle 'Shougo/neocomplcache'

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
set background=dark
"colorscheme evening
colorscheme elflord

"---------------------------------------------------
"neocomplcacheの設定(neocompleteへ移行予定)
"【参照元】
"　https://github.com/Shougo/neocomplcache.vim
"  qiita.com/hide/items/229ff9460e75426a2d07
"---------------------------------------------------

"Disable AutoComlPop.
let g:acp_enableAtStartup = 0

"Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"Use smartcase.
let g:neocomplcache_enable_smart_case = 1

"Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

"Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

"Recommended key-mappings.
"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

"<TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"<C-h>, <BS>: close popup and delte backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#smart_close_popup()
inoremap <expr><C-e> neocomplcache#smart_close_popup()

"----------------------------------------------------------------
