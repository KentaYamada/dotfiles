packadd vim-jetpack

call jetpack#begin()
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
call jetpack#end()
