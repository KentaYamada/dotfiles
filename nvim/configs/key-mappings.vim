"--------------------------
" key-mappings.vim
" キーマッピング設定
"
" Author: YamaKen
"--------------------------

" 特定のキーマップを無効化
nnoremap q: <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop> 

" 上下左右キー無効化
" Todo: 操作に慣れたらマッピング解除
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" init.vim再読み込み
nnoremap <silent> <leader><leader> :source $MYVIMRC<CR>

" ESC連打でハイライトリセット
nnoremap <silent><ESC><ESC> :noh<CR>

" カーソル下の単語を置換後の文字列の入力待ち状態にする
nnoremap <leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 貼り付け先のインデントに合わせてペースト
nnoremap p ]p
nnoremap P ]P

" 新規バッファを開く
nnoremap <silent> vn :vs +enew<CR>
nnoremap <silent> sn :sp +enew<CR>


"----------
" タブ操作
"----------
nnoremap tnw :<C-u>tabnew<CR>  " 新しいタブを開く
nnoremap tc :<C-u>tabclose<CR> " タブを閉じる
nnoremap tn gt                 " 次のタブへ
nnoremap tp gT                 " 前のタブへ

"--------------------
" コマンドモード操作
"--------------------
" アクティブなファイルのディレクトリを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" ---------------------
" ターミナルモード操作
" ---------------------
" ESCキーでノーマルモードに切替
tnoremap <ESC> <C-\><C-n>

