--
-- telescope
-- see: https://github.com/nvim-telescope/telescope.nvim
--
local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local config = {
  defaults = {
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules", ".git/" },
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    preview = {
      -- note: `nvim-treesitter`を`main`に切り替えたことで、`ft_to_lang`が実行エラーになるのを抑制する
      treesitter = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      enable_prompt_mappings = true,
    },
    file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
    },
  },
}
telescope.setup(config)
telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("file_browser")


-- key mapping
-- pickers: https://github.com/nvim-telescope/telescope.nvim#pickers
vim.keymap.set("n", "<leader>o", builtin.find_files, { noremap = true, silent = true, desc = "Telescope find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { noremap = true, silent = true, desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { noremap = true, silent = true, desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", builtin.oldfiles, { noremap = true, silent = true, desc = "Telescope oldfiles" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { noremap = true, silent = true, desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>r", function()
  telescope.extensions.frecency.frecency()
end, { noremap = true, silent = true, desc = "Telescope find recent files" })

-- 操作方法覚えるまではこのままで
vim.keymap.set("n", "<leader>fb", function ()
  telescope.extensions.file_browser.file_browser({
    hidden = true,
    grouped = true,
  })
end, { noremap = true, silent = true, desc = "Toggle file browser" })
