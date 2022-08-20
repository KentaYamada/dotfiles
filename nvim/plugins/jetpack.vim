packadd vim-jetpack

call jetpack#begin()

" パッケージマネージャー本体
Jetpack 'tani/vim-jetpack', {'opt': 1} " bootstrap
" ファイルエクスプローラー
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', {'do': {-> fzf#install()}}
Jetpack 'lambdalisue/nerdfont.vim'
Jetpack 'lambdalisue/fern.vim'
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack 'lambdalisue/fern-git-status.vim'

" ステータスライン
Jetpack 'itchyny/lightline.vim'
" カラースキーム
Jetpack 'sainnhe/sonokai'
Jetpack 'phanviet/vim-monokai-pro'
" emmet
Jetpack 'mattn/emmet-vim', {'for': 'html'}
" firestoreシンタックス
Jetpack 'delphinus/vim-firestore', {'for': 'firestore'}

" lsp
Jetpack 'williamboman/mason.nvim'
Jetpack 'williamboman/mason-lspconfig.nvim'
Jetpack 'neovim/nvim-lspconfig'

" 補完
Jetpack 'hrsh7th/cmp-nvim-lsp'
Jetpack 'hrsh7th/nvim-cmp'
Jetpack 'hrsh7th/cmp-vsnip'
Jetpack 'hrsh7th/vim-vsnip'
Jetpack 'hrsh7th/cmp-buffer'
Jetpack 'hrsh7th/cmp-path'
call jetpack#end()


" Key mappings
" Package update
nnoremap <silent><leader>pu :JetpackSync<CR>
