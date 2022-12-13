lua << EOF

local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        'c',
        'cpp',
        'css',
        'javascript',
        'json',
        'html',
        'make',
        'php',
        'typescript'
    },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
        disable = {
            'lua',
            'vue'
        }
    }
})

EOF
