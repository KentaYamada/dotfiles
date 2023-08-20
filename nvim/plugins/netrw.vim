"-----------------------------------------------
" netrw.vim
" vim標準ファイルエクスプローラープラグイン設定
"
" Author: YamaKen
"-----------------------------------------------

" Tree形式で表示する
let g:netrw_liststyle = 3

" ヘッダを非表示にする
let g:netrw_banner = 0

" ファイルサイズをK, M, Gで表示する
let g:netrw_sizestyle = "H"

" 日付フォーマット (yyyy/mm/dd hh:mm:ss)
let g:netrw_timefmt = "%Y/%m/%d %H:%M:%S"

" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview = 1

" 分割して開いたときのサイズ (40%)
let g:netrw_winsize = 40

" netrwトグル開閉
function! ToggleNetrw()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . "wincmd w"
            close
            exec cur_win_nr . "wincmd w"
        endif
        unlet t:expl_buf_num
    else
        exec "1wincmd w"
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction

nnoremap <silent> <C-e> :call ToggleNetrw()<CR>
