
if exists('b:did_ftplugin_markdown')
    finish
endif
let b:did_ftplugin_markdown = 1


"ブラウザプレビュー
"Mac OSX
" -Safari
"   open -a Safari
" - FireFox
"   open -a FireFox
" - Google Chrome
"   open /Applications/Google\ Chrome.app
"Linux
"
if has('mac')
  nnoremap <F5> :!open /Applications/Google\ Chrome.app %<CR>
elseif has('win32')
  "Do something
else
  nnoremap <F5> :!google-chrome %<CR>
endif

