--
-- treesitter config
-- see: https://github.com/nvim-treesitter/nvim-treesitter
--
local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
    -- A list of parser names, or "all"
    -- See parsers: https://github.com/tree-sitter/tree-sitter/wiki/List-of-parsers
    ensure_installed = {
        'c',
        'cpp',
        'css',
        'csv',
        'dockerfile',
        'javascript',
        'json',
        'lua',
        'html',
        'make',
        'markdown',
        'python',
        'rust',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    }
})
