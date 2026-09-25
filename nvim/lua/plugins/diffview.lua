--
-- diffview.nvim plugin config
--
local dv = require("diffview")
local config = {
  enhanced_diff_hl = true,
  hooks = {
    view_opened = function(_view)
      -- Automatically equalize window sizes when the diffview opens
      vim.cmd("wincmd =")
    end,
  },
}

dv.setup(config)
