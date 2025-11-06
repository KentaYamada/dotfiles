-- gitsings
-- see: https://github.com/lewis6991/gitsigns.nvim/tree/main
local gitsigns = require("gitsigns")
local config = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged_enable = true,
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true,
    interval = 1000,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    delay = 1000,
    ignore_whitespace = false,
    use_focus = true,
    virt_text = true,
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    virt_text_priority = 100,
  },
  current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
    border = "rounded",
  },
  on_attach = function(bufnr)
    -- Key mappings
    -- see: https://github.com/lewis6991/gitsigns.nvim/tree/main?tab=readme-ov-file#-keymaps
    local opts = { buffer = bufnr }

    -- blame actions
    vim.keymap.set("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end)

    vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, opts)
    vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, opts)
  end,
}
gitsigns.setup(config)
