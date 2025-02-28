--
-- none-ls (null-ls) configuration
--
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local sources = {
    formatting.clang_format,
    formatting.prettier.with({
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "css",
            "scss",
        }
    })
}
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        -- Avoiding LSP formatting conflicts
        -- see: https://github.com/nvimtools/none-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
        async = false,
    })
end
null_ls.setup({
    sources = sources,
    debug = false,
    diagnostics_format = "#{m} (#{s}: #{c})",
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
})
