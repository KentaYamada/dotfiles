"-----------------
" environment.vim
"
" Author: YamaKen
"-----------------

" ローカル環境に'.vimrc.local'があれば、それを読み込む
function! s:VimrcLocal(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction

augroup localVimrcCmd
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:VimrcLocal(expand('<afile>:p:h'))
    autocmd BufReadPre .vimrc.local setfiletype=vim
augroup END
