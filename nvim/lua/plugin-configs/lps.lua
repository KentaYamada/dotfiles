-- LSP configuration
-- References
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim 
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
        'clangd',
        'eslint',
        'tsserver',
        'lua_ls',
        'vimls'
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = false,
})

-- Linter, Formatter configuration
local null_ls = require('null-ls')
-- null_ls.setup({
--     sources = {
-- 
--     }
-- })

-- Complement configuration
local cmp = require('cmp')
