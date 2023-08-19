-- LSP configuration
-- References
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim 
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

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

-- Complement configuration
-- See: 
local cmp = require('cmp')
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'},
        {name = 'vsnip'},
    }
})

-- 補完時にLSPが効くようにする
mason_lspconfig.setup_handlers({ function(server_name)
    local cmplsp = require('cmp_nvim_lsp')
    local opts = {
        capabilities = cmplsp.default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
    lspconfig[server_name].setup(opts)
end })

-- Linter, Formatter configuration
local null_ls = require('null-ls')
-- null_ls.setup({
--     sources = {
-- 
--     }
-- })
