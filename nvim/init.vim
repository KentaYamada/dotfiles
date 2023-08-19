"-----------------
" init.vim
" Neovim設定
"
" Author: YamaKen
"-----------------

"---------------
" basic configs
"---------------
source ~/.config/nvim/configs/environment.vim
source ~/.config/nvim/configs/options.vim
source ~/.config/nvim/lua/basic-configs/options.lua
source ~/.config/nvim/lua/basic-configs/keymaps.lua
source ~/.config/nvim/lua/basic-configs/commands.lua
source ~/.config/nvim/lua/basic-configs/triggers.lua

" Package manager
source ~/.config/nvim/lua/plugin-configs/jetpack.lua
" Fuzzy finder
source ~/.config/nvim/lua/plugin-configs/telescope.lua
" File explore
source ~/.config/nvim/lua/plugin-configs/nvim-tree-lua.lua
" Status line plugin
source ~/.config/nvim/lua/plugin-configs/lualine.lua
" Language server plugin
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/lua/plugin-configs/lps.lua
" Colorscheme
source ~/.config/nvim/lua/basic-configs/color.lua
" Syntax color
source ~/.config/nvim/lua/plugin-configs/treesitter.lua
" Git
source ~/.config/nvim/lua/plugin-configs/gitsigns.lua
source ~/.config/nvim/lua/plugin-configs/neogit.lua
