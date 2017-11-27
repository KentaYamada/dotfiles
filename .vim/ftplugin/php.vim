


if exists('b:did_ftplugin_php')
    finish
endif
let b:did_ftplugin_php = 1


"インデント関係の設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" デフォルトDBの設定
let g:sql_type_default = 'mysql'
