


if exists('b:did_ftplugin_php')
    finish
endif
let b:did_ftplugin_php = 1


"インデント関係の設定
setlocal smarttab
setlocal expandtab
setlocal shiftwidth=4

"Syntacs check
if has('php')
    augroup MyPhP
        autocmd!
        autocmd FileType php set makeprg=php\ -I\ %
        autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
    augroup END
endif
