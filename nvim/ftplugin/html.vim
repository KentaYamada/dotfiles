"----------------------------
" html filetype config
"
" Author: YamaKen
"----------------------------
if exists('b:did_ftplugin_html')
    finish
endif
let b:did_ftplugin_html = 1

" indent
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
