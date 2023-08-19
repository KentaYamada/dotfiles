vim.cmd('filetype plugin indent off')
vim.cmd('packadd vim-jetpack')

-- see: https://github.com/tani/vim-jetpack#modern-packernvim-paqnvim-style-1
require('jetpack.packer').add {
    -- Bootstrap
    {'tani/vim-jetpack', opt = true},
    -- Utility
    {'nvim-lua/plenary.nvim'},
    {'sindrets/diffview.nvim'},
    -- Finder
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.2'},
    -- File explore
    {'nvim-tree/nvim-tree.lua'},
    {'lambdalisue/nerdfont.vim'},
    {'lambdalisue/fern.vim'},
    {'lambdalisue/fern-renderer-nerdfont.vim'},
    {'lambdalisue/fern-git-status.vim'},
    {'lambdalisue/glyph-palette.vim'},
    -- Statusline
    -- todo: replace to lua line
    {'itchyny/lightline.vim'},
    {'nvim-lualine/lualine.nvim'},
    -- Colorscheme
    {'EdenEast/nightfox.nvim'},
    -- Emet
    {'mattn/emmet-vim', ft = 'html'},
    -- Syntax
    {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'},
    -- nvim用のやつないか調査
    {'delphinus/vim-firestore', ft = 'firestore'},
    -- LSP
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neoclide/coc.nvim' , branch = 'release'},
    -- Linter, Formatter
    {'jose-elias-alvarez/null-ls.nvim'},
    -- Complement
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-vsnip'},
    -- Git
    {'TimUntersberger/neogit'},
    {'lewis6991/gitsigns.nvim'},
}
vim.cmd('filetype plugin indent on')
