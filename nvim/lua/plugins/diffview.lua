--
-- diffview.nvim plugin config
--
local dv = require("diffview")
local config = {
  hooks = {
    view_opened = function(_view)
      -- Automatically equalize window sizes when the diffview opens
      vim.cmd("wincmd =")
    end,
  },
}

dv.setup(config)
