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

"--------------
"キーマップ設定

" Python3 
nnoremap <F5> :!python3 %<CR>

" pudB(デバッガツール)
nnoremap <F6> :!pudb3 %<CR>
