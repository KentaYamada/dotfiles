" ---------------------------
" null-ls.nvim
" LSP 診断, フォーマット設定
"
" Author: YamaKen
" ---------------------------
lua << EOF
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.prettier
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- aync formatting
-- note: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#code-1
local async_format = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local erro_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. erro_msg, vim.log.lovels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-8")
                vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent noautocmd update") end)
            end
        end
    )
end

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() async_format(bufnr) end,
        })
    end
end

null_ls.setup({ sources = sources, on_attach = on_attach })
EOF
