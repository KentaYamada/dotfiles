
if exists('b:did_ftplugin_html')
    finish
endif
let b:did_ftplugin_html = 1

"インデント設定
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

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
  nnoremap <F5> :!open /Applications/Google\ Chrome.app %
elseif has('win32')
  "Do something
else
  "【FireFox】
  "  firefox
  "【Google Chrome】
  "  google-chrome
  nnoremap <F5> :!google-chrome %
endif
