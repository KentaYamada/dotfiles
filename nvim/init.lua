-- init.lua
-- load lua file: require('module_name')
-- load vimscript file: vim.cmd('source ' .. {filepath})

-- Basic configs
vim.cmd('source ' .. '~/.config/nvim/configs/environment.vim')

require('core/options')
require('core/keymaps')

require('base/commands')
require('base/triggers')

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
-- Colorscheme
require('base/color')
-- Syntax color
require('extensions/treesitter')
-- Git
require('extensions/gitsigns')
-- Rust
require('extensions/crates')
