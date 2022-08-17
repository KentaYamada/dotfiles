let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['gitbranch', 'readonly', 'filename', 'modified']
    \   ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \ }
\ }

" vim-deviconsを表示できるようにする
" see: https://github.com/ryanoasis/vim-devicons/wiki/usage
"function! MyFileType()
"    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' + WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction
"
"function! MyFileFormat()
"    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileTypeSymbol()) : ''
"endfunction
"
