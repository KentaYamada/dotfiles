vim.cmd('filetype plugin indent off')
vim.cmd('packadd vim-jetpack')

-- see: https://github.com/tani/vim-jetpack#modern-packernvim-paqnvim-style-1
require('jetpack.packer').add {
    -- Bootstrap
    {'tani/vim-jetpack', as = 'jetpack', opt = true},
    -- Utility
    {'nvim-lua/plenary.nvim'},
    {'sindrets/diffview.nvim'},
    -- Finder
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.8'},
    {"nvim-telescope/telescope-file-browser.nvim"},
    -- File explore
    {'nvim-tree/nvim-tree.lua'},
    -- Statusline
    {'nvim-lualine/lualine.nvim'},
    -- Colorscheme
    {'EdenEast/nightfox.nvim'},
    {"rebelot/kanagawa.nvim"},
    -- Syntax
    {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    },
    {'delphinus/vim-firestore', ft = 'firestore'},
    -- LSP
    {'williamboman/mason.nvim'},
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason-lspconfig.nvim'},
    {'nvimtools/none-ls.nvim'},
    -- Complement
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
    {'hrsh7th/cmp-nvim-lsp-document-symbol'},
    {'onsails/lspkind.nvim'},
    -- Git
    {'lewis6991/gitsigns.nvim'},
    -- Rust
    {'saecki/crates.nvim', tag = 'stable'},
}
vim.cmd('filetype plugin indent on')
