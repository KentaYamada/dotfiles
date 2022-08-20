"-----------------------
" nvim-comp.vim
" LSP補完プラグイン設定
"
" Author: YamaKen
"-----------------------
set completeopt=menu,menuone,noselect

lua << EOF
local cmp = require("cmp")

cmp.setup({
    snippet = {
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
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    experimental = {
        ghost_text = true
    }
})

local lsp_config = require("lspconfig")
local mason_lsp_config = require("mason-lspconfig")

mason_lsp_config.setup_handlers({ function(server)
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local opts = {
        capabilities = cmp_nvim_lsp.update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
    lsp_config[server].setup(opts)
end })

EOF
