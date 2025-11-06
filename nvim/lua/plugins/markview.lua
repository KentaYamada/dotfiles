--
-- markdown preview plugin
-- see: https://github.com/OXY2DEV/markview.nvim
--
local previewer = require("markview")
local config = {
  preview = {
    enable = false, -- デフォルトでプレビュー表示しない
    icon_provider = "devicons",
  },
}
previewer.setup(config)

-- Key mappings
vim.keymap.set("n", "<Leader>mp", ":Markview splitToggle<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle markdown preview",
})
