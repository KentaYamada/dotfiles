-- formatter.nvim configuration
-- see: https://github.com/mhartington/formatter.nvim
local util = require('formatter.util')

require('formatter').setup({
     -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        javascript = {
            require('formatter.filetypes.javascript').prettier
        },
        javascriptreqct = {
            require('formatter.filetypes.javascriptreact').prettier
        },
        typescript = {
            require('formatter.filetypes.typescript').prettier
        },
        typescriptreqct = {
            require('formatter.filetypes.typescriptreact').prettier
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup('FormatterCmd', {clear = true})
autocmd({'BufWritePost'}, {
    group = 'FormatterCmd',
    pattern = '*',
    command = 'FormatWrite'
})
