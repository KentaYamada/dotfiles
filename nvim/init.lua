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
-- Complement
require("extensions/complement")
-- Formatter
-- require("extensions/none-ls")
-- Git
require("extensions/gitsigns")
-- Rust
require("extensions/crates")

-- Plugins
require("plugins/colorscheme")
require("plugins/statusline")
require("plugins/treesitter")
require("plugins/telescope")
require("plugins/lsp")
require("plugins/formatter")
