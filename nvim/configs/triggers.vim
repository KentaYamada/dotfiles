"----------------
" triggers.vim
"
" Author: YamaKen
"----------------

augroup CakePhpCmd
    autocmd!
    autocmd BufNewFile,BufRead *.ctp setfiletype php
augroup END

augroup TermCmd
    autocmd!
    autocmd TermOpen * startinsert " Terminal modeで開いたときにインサートモードにする
augroup END

augroup TomlCmd
    autocmd!
    autocmd BufNewFile,BufRead *.toml setfiletype conf
augroup END

augroup TypeScriptCmd
    autocmd!
    autocmd BufNewFile,BufRead *.ts setfiletype typescript
augroup END
