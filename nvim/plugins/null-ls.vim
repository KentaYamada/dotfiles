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

null_ls.setup({ sources = sources })
EOF
