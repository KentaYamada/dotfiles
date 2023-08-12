"
" commands.vim
"

" terminal modeを開く
command! -nargs=* ShowTerminal split | wincmd j | resize 15 | terminal <args>
