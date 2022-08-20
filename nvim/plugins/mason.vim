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

EOF
