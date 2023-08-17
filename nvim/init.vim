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

source ~/.config/nvim/lua/plugin-configs/jetpack.lua

" file explore plugins
source ~/.config/nvim/lua/plugin-configs/telescope.lua

" status line plugin
source ~/.config/nvim/lua/plugin-configs/lualine.lua

" language server plugin
" source ~/.config/nvim/plugins/nvim-comp.vim
" source ~/.config/nvim/plugins/mason.vim
" source ~/.config/nvim/plugins/nvim-lsp.vim
" source ~/.config/nvim/plugins/null-ls.vim
source ~/.config/nvim/plugins/coc.vim

source ~/.config/nvim/lua/basic-configs/color.lua

source ~/.config/nvim/lua/plugin-configs/treesitter.lua

" Git
source ~/.config/nvim/lua/plugin-configs/gitsigns.lua
source ~/.config/nvim/lua/plugin-configs/neogit.lua
