"----------------------
" yaml filetype config
"
" Author: YamaKen
"----------------------
if exists('b:did_ftplugin_yaml')
    finish
endif
let b:did_ftplugin_yaml = 1

" indent
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
