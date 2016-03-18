"
" Language:Python
"

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

"インデント関係の設定
setlocal smarttab
setlocal expandtab
setlocal shiftwidth=4

"入力補完の有効化
setlocal omnifunc=jedi#completions

"Python関連の設定
nnoremap <F5> :!python3 %<CR>

