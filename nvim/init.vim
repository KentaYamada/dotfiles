"-----------------
" init.vim
" Neovim設定
"
" Author: YamaKen
"-----------------

"---------------
" basic configs
"---------------
" source ~/.config/nvim/configs/variables.vim
source ~/.config/nvim/configs/environment.vim
source ~/.config/nvim/configs/options.vim
source ~/.config/nvim/lua/basic-configs/keymaps.lua
source ~/.config/nvim/configs/commands.vim
source ~/.config/nvim/lua/basic-configs/triggers.lua

filetype plugin indent off

source ~/.config/nvim/plugins/jetpack.vim

filetype plugin indent on

" file explore plugins
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/fern.vim

" status line plugin
source ~/.config/nvim/plugins/lightline.vim

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
