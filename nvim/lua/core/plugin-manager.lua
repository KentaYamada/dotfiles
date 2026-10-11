--
-- Plugin manager
--

-- `PackChanged` event handler
-- @param e event data
local onPackChanged = function(e)
  local name = e.data.spec.name
  local kind = e.data.kind
  local installOrUpdate = kind == "install" or kind == "update"

  if name == "telescope-fzf-native.nvim" and installOrUpdate then
    vim.system({ "make" }, { cwd = e.data.path }):wait()
  end

  if name == "nvim-treesitter" and installOrUpdate then
    vim.cmd("TSUpdate")
  end
end

-- Hook event before run `vim.pack.add`
vim.api.nvim_create_autocmd("PackChanged", { callback = onPackChanged })

-- Update package command
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, { desc = "Update packages" })

-- GitHub repository URLの生成
-- @param name repository name
-- @return GitHub repository URL
local gh = function(name)
  return "https://github.com/" .. name
end

vim.pack.add({
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("sindrets/diffview.nvim") },
  { src = gh("nvim-tree/nvim-web-devicons") },
  { src = gh("nvim-telescope/telescope.nvim"),           version = "0.1.8" },
  { src = gh("nvim-telescope/telescope-fzf-native.nvim") },
  { src = gh("nvim-telescope/telescope-frecency.nvim"),  version = vim.version.range("^1.0.0") },
  { src = gh("nvim-telescope/telescope-ui-select.nvim") },
  { src = gh("nvim-tree/nvim-tree.lua") },
  { src = gh("nvim-treesitter/nvim-treesitter"),         version = "main" },
  { src = gh("nvim-lualine/lualine.nvim") },
  { src = gh("rebelot/kanagawa.nvim") },
  { src = gh("EdenEast/nightfox.nvim") },
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("williamboman/mason.nvim") },
  { src = gh("williamboman/mason-lspconfig.nvim") },
  { src = gh("stevearc/conform.nvim") },
  { src = gh("hrsh7th/nvim-cmp") },
  { src = gh("hrsh7th/cmp-buffer") },
  { src = gh("hrsh7th/cmp-cmdline") },
  { src = gh("hrsh7th/cmp-path") },
  { src = gh("hrsh7th/cmp-nvim-lsp") },
  { src = gh("hrsh7th/cmp-nvim-lsp-signature-help") },
  { src = gh("hrsh7th/cmp-nvim-lsp-document-symbol") },
  { src = gh("onsails/lspkind.nvim") },
  { src = gh("L3MON4D3/LuaSnip"),                        version = "v2.4.1" },
  { src = gh("saecki/crates.nvim"),                      version = "stable" },
  { src = gh("lewis6991/gitsigns.nvim") },
  { src = gh("delphinus/vim-firestore") },
  { src = gh("OXY2DEV/markview.nvim") },
})
