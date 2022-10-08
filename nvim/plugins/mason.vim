"----------------------------------
" mason.vim
" Language server マネージャー設定
" depends on lsp-setting
"
" Author: YamaKen
"----------------------------------
lua << EOF
local mason = require("mason")
local mason_lsp_config = require("mason-lspconfig")
local on_attach = function(client, bufnr)
    -- LSPサーバーのフォーマット機能を無効化
    -- ex) tsserverのフォーマットではなく、prettierを利用したい場合
    client.server_capabilities.documentFormattingProvider = false

    -- Key mappings
    local mapping_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>ge", "<cmd>lua vim.diagnostic.open_float()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", mapping_opts)
    vim.keymap.set("n", "<leader>g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", mapping_opts)

    -- auto commands
    -- formatting on save
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        command = "lua vim.lsp.buf.formatting_sync()"
    })
end

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
mason_lsp_config.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            on_attach = on_attach
        })
    end,
})

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

EOF
