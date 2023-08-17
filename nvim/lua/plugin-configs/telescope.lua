-- telescope configuration
-- see: https://github.com/nvim-telescope/telescope.nvim
-- :h telescope.nvim
local telescope = require('telescope.builtin')

-- pickers: https://github.com/nvim-telescope/telescope.nvim#pickers
vim.keymap.set('n', '<leader>o', telescope.find_files, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>g', telescope.live_grep, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>G', telescope.grep_string, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>b', telescope.buffers, { noremap = true, silent = true})
