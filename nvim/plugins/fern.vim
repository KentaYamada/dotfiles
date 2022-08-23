"
" fern.vim
" ファイルエクスプローラープラグイン設定
"

" Variables
let g:fern#renderer='nerdfont' " show nerd icons
let g:fern#default_hidden=1 " 隠しファイル表示

" Key mappings
nnoremap <silent><leader>e :Fern . -reveal=% -drawer -toggle -width=30<CR>

function! s:fern_init() abort
    nmap <buffer><nowait> v <Plug>(fern-action-open:vsplit)
endfunction

augroup FernCmd
    autocmd! *
    autocmd FileType fern call s:fern_init()
augroup END
