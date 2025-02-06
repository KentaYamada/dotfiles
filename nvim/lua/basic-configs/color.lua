--
-- Color scheme configuration
-- See
--  https://github.com/EdenEast/nightfox.nvim
--

local nightfox = require('nightfox')

nightfox.setup({
    options = {
        terminal_colors = true,
    },
})

-- setup must be called before loading
vim.cmd ('colorscheme nightfox')
