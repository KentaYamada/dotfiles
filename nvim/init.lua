-- init.lua
-- load lua file: require('module_name')
-- load vimscript file: vim.cmd('source ' .. {filepath})

-- Core
require('core/options')
require('core/keymaps')
require('core/commands')
require('core/triggers')


-- Extensions
-- Package manager
require('extensions/jetpack')
-- Fuzzy finder
require('extensions/telescope')
-- File explore
require('extensions/nvim-tree-lua')
-- Status line plugin
require('extensions/lualine')
-- Language server plugin
require('extensions/lsp')
-- Complement
require('extensions/complement')
-- Formatter
require('extensions/none-ls')
-- Syntax color
require('extensions/treesitter')
-- Git
require('extensions/gitsigns')
-- Rust
require('extensions/crates')

-- Plugins
-- color schema
require("plugins/colorscheme")
