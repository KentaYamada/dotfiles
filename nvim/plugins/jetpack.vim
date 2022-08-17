packadd vim-jetpack

call jetpack#begin()

" パッケージマネージャー本体
Jetpack 'tani/vim-jetpack', {'opt': 1} " bootstrap
" ファイルエクスプローラー
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', {'do': {-> fzf#install()}}
" ステータスライン
Jetpack 'itchyny/lightline.vim'
" カラースキーム
Jetpack 'sainnhe/sonokai'
" emmet
Jetpack 'mattn/emmet-vim', {'for': 'html'}
" firestoreシンタックス
Jetpack 'delphinus/vim-firestore', {'for': 'firestore'}

call jetpack#end()
