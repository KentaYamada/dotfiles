
if exists('b:did_ftplugin_html')
    finish
endif
let b:did_ftplugin_html = 1

"インデント設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"--------------
"キーマップ設定
  
"ブラウザ起動
if has('mac')
  "【Safari】
  "  open -a Safari
  "【FireFox】
  "  open -a Firefox
  "【Google Chrome】
  "  open /Applications/Google\ Chrome.app
  nnoremap <F5> :!open /Applications/Google\ Chrome.app %<CR>
elseif has('win32')
  "Do something
else
  "【FireFox】
  "  firefox
  "【Google Chrome】
  "  google-chrome
  nnoremap <F5> :!google-chrome %<CR>
endif
