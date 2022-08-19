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

" lsp
Jetpack 'williamboman/mason.nvim'
Jetpack 'williamboman/mason-lspconfig.nvim'
Jetpack 'neovim/nvim-lspconfig'

" completion
Jetpack 'hrsh7th/cmp-nvim-lsp'
Jetpack 'hrsh7th/nvim-cmp'
Jetpack 'hrsh7th/cmp-vsnip'
Jetpack 'hrsh7th/vim-vsnip'

call jetpack#end()
