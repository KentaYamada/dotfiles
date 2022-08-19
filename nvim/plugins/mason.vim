"----------------------------------
" mason.vim
" Language server マネージャー設定
" depends on lsp-setting
"
" Author: YamaKen
"----------------------------------

set completeopt=menu,menuone,noselect

lua << EOF

local lsp_config = require("lspconfig")
local mason = require("mason")
local mason_lsp_config = require("mason-lspconfig")
local cmp = require("cmp")

mason_lsp_config.setup_handlers({ function(server)
    local opts = {
        capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
    lsp_config[server].setup(opts)
end })

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
mason_lsp_config.setup({
    ensure_installed = {
        "sumneko_lua",
        "tsserver"
    }
})
cmp.setup({
    snipet = {
        -- Required: must be set specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- For `vsnip` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }),
    experimental = {
        ghost_text = true
    }
})

-- Key mappings
local mapping_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>ge", "<cmd>lua vim.diagnostic.open_float()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", mapping_opts)
vim.keymap.set("n", "<leader>g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", mapping_opts)

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

EOF
