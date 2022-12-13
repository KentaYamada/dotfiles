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
Jetpack 'lambdalisue/glyph-palette.vim'

" ステータスライン
Jetpack 'itchyny/lightline.vim'
" カラースキーム
Jetpack 'phanviet/vim-monokai-pro'
Jetpack 'EdenEast/nightfox.nvim'

" emmet
Jetpack 'mattn/emmet-vim', {'for': 'html'}
" firestoreシンタックス
Jetpack 'delphinus/vim-firestore', {'for': 'firestore'}
" Syntax Color
Jetpack 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

" lsp
Jetpack 'neovim/nvim-lspconfig'
Jetpack 'williamboman/mason.nvim'
Jetpack 'williamboman/mason-lspconfig.nvim'

" 補完
Jetpack 'hrsh7th/cmp-nvim-lsp'
Jetpack 'hrsh7th/cmp-buffer'
Jetpack 'hrsh7th/cmp-path'
Jetpack 'hrsh7th/cmp-cmdline'
Jetpack 'hrsh7th/nvim-cmp'

Jetpack 'hrsh7th/cmp-vsnip'
Jetpack 'hrsh7th/vim-vsnip'

Jetpack 'nvim-lua/plenary.nvim'
Jetpack 'jose-elias-alvarez/null-ls.nvim'

call jetpack#end()


" Key mappings
" Package update
nnoremap <silent><leader>pu :JetpackSync<CR>
