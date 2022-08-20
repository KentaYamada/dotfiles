"
" fern.vim
" ファイルエクスプローラープラグイン設定
"

" Variables
let g:fern#renderer='nerdfont' " show nerd icons
let g:fern#default_hidden=1 " 隠しファイル表示

" Key mappings
nnoremap <silent><leader>e :Fern . -reveal=% -drawer -toggle -width=30<CR>
