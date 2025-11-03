-- LSP Config
--
-- Package manager (https://github.com/williamboman/mason.nvim)
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local ensure_installed = {
    'clangd',
    'eslint',
    'lua_ls',
    'pylsp',
    'rust_analyzer',
    'ts_ls',
    'vimls',
}

mason.setup()
mason_lspconfig.setup {
    automatic_enable = true,
    ensure_installed = ensure_installed,
}

vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})

-- rustのlinterを`clippy`を使う
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust_analyzer'] = {
            check = {
                command = 'clippy',
            }
        }
    }
})

vim.lsp.enable(ensure_installed)

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  update_in_insert = false,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = '宣言にジャンプ' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = '定義にジャンプ' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'ホバー表示' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'リネーム' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)

        -- Format onSave if none-ls not supported
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = { "*.rs" },
            callback = function ()
                vim.lsp.buf.format({ buffer = ev.buf, async = false })
            end,
        })
    end
})
