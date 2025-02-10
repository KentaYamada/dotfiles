-- init.lua
-- load lua file: require('module_name')
-- load vimscript file: vim.cmd('source ' .. {filepath})

-- Basic configs
vim.cmd('source ' .. '~/.config/nvim/configs/environment.vim')
vim.cmd('source ' .. '~/.config/nvim/configs/options.vim')
require('basic-configs/options')
require('basic-configs/keymaps')
require('basic-configs/commands')
require('basic-configs/triggers')
-- Package manager
require('plugin-configs/jetpack')
-- Fuzzy finder
require('plugin-configs/telescope')
-- File explore
require('plugin-configs/nvim-tree-lua')
-- Status line plugin
require('plugin-configs/lualine')
-- Language server plugin
require('plugin-configs/lsp')
-- Complement
require('plugin-configs/complement')
-- Formatter
require('plugin-configs/none-ls')
-- Colorscheme
require('basic-configs/color')
-- Syntax color
require('plugin-configs/treesitter')
-- Git
require('plugin-configs/gitsigns')
require('plugin-configs/neogit')
