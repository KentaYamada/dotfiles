vim.cmd("filetype plugin indent off")
vim.cmd("packadd vim-jetpack")

-- see: https://github.com/tani/vim-jetpack#modern-packernvim-paqnvim-style-1
require("jetpack.packer").add({
  -- Bootstrap
  { "tani/vim-jetpack", as = "jetpack", opt = true },
  { "nvim-lua/plenary.nvim" },
  { "sindrets/diffview.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "nvim-telescope/telescope-frecency.nvim", version = "*" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },

  { "nvim-tree/nvim-tree.lua" },
  { "nvim-lualine/lualine.nvim" },

  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "nvim-treesitter/nvim-treesitter", branch = "main", run = ":TSUpdate" },

  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "stevearc/conform.nvim" },

  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip", tag = "v2.4.1", run = "make install_jsregexp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "onsails/lspkind.nvim" },

  { "lewis6991/gitsigns.nvim" },

  { "saecki/crates.nvim", tag = "stable" },
  { "delphinus/vim-firestore", ft = "firestore" },
  { "OXY2DEV/markview.nvim" },
})
vim.cmd("filetype plugin indent on")
