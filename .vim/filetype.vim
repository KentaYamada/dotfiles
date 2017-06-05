
if exists("g:did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufRead,BufNewFile *.md setf markdown
    au BufRead,BufNewFile *.mkd setf markdown
    au BufRead,BufNewFile *.php setf php
    au BufRead,BufNewFile *.ctp setf html
augroup END
