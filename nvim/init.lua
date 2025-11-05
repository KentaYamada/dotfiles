-- init.lua
-- load lua file: require('module_name')
-- load vimscript file: vim.cmd('source ' .. {filepath})

-- Core
require("core/options")
require("core/keymaps")
require("core/commands")
require("core/triggers")

-- Extensions
-- Package manager
require("extensions/jetpack")
-- File explore
require("extensions/nvim-tree-lua")
-- Git
require("extensions/gitsigns")

-- Plugins
require("plugins.colorscheme")
require("plugins.statusline")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.crates")
require("plugins.lsp")
require("plugins.formatter")
require("plugins.nvim-cmp")
