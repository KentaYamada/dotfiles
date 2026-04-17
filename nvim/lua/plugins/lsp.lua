--
-- Language Server Protocol
-- (Neovim >= v0.11)
--

-- Mason (package manager)
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local servers = {
  "clangd",
  "eslint",
  "lua_ls",
  "pylsp",
  "rust_analyzer",
  "stylua",
  "ts_ls",
  "vimls",
}
mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

-- Lua (Neovim dev friendly)
vim.lsp.config("lua_ls", {
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telementry = { enable = true },
    },
  },
})

-- Rust
vim.lsp.config("rust_analyzer", {
  filetypes = { "rust" },
  settings = {
    check = { command = "clippy" },
  },
})

-- Diagnostic
vim.diagnostic.config({
  serverity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
})

-- LSP有効化
vim.lsp.enable(servers)

-- ヒント表示
vim.lsp.inlay_hint.enable(true)

-- Key mappings
-- Global diagnostic key mappings
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Configure buffer local mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local configure_keymaps = function(buf)
  local opts = { buffer = buf }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "宣言にジャンプ" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "定義にジャンプ" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "ホバー表示" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "リネーム" })
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Assign key maps
    configure_keymaps(ev.buf)

    -- Auto format on save
    if
      not client:supports_method("textDocument/willSaveWaitUntil")
      and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("FormatOnSave", { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 2000, async = false })
        end,
      })
    end
  end,
})
