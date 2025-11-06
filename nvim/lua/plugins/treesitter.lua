--
-- treesitter
-- see:https://github.com/nvim-treesitter/nvim-treesitter/tree/main
--
local treesitter = require("nvim-treesitter")
local config = {}

-- See supported parsers
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
treesitter
  .install({
    "c",
    "cpp",
    "css",
    "csv",
    "dockerfile",
    "javascript",
    "json",
    "lua",
    "html",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "sql",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  })
  :wait(120000) -- max. 2 minutes

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("TreesitterStart", { clear = true })
autocmd("FileType", {
  group = "TreesitterStart",
  pattern = { "<filetype>" },
  callback = function()
    vim.treesitter.start()
  end,
})
