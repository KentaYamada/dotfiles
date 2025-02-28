-- telescope configuration
-- see: https://github.com/nvim-telescope/telescope.nvim
-- :h telescope.nvim
local telescope = require('telescope')

telescope.setup({
    extensions = {
        file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    },
})

-- load extensions
telescope.load_extension('file_browser')

local builtin = require('telescope.builtin')

-- pickers: https://github.com/nvim-telescope/telescope.nvim#pickers
vim.keymap.set('n', '<leader>o', builtin.find_files, { noremap = true, silent = true, desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { noremap = true, silent = true, desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>G', builtin.grep_string, { noremap = true, silent = true, desc = 'Telescope live string' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true, silent = true, desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.oldfiles, { noremap = true, silent = true, desc = 'Telescope oldfiles' })
vim.keymap.set('n', '<leader>d', builtin.diagnostics, { noremap = true, silent = true, desc = 'Telescope diagnostics' })

-- extention keymapings
-- vim.keymap.set('n', '<leader>e', function()
--     telescope.extensions.file_browser.file_browser()
-- end, { noremap = true, silent = true, desc = 'Telescope open file explore' })
