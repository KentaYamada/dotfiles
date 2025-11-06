--
-- status line plugin config
-- see: https://github.com/nvim-lualine/lualine.nvim
--
-- todo: 各コンポーネントのスタイル
require('lualine').setup({
  options = {
    theme = "kanagawa",
    globalstatus = true,
    component_separators = {},
    section_separators = {},
  },
  sections = {
    lualine_a = {{ "filename" }},
    lualine_b = { "diagnostics" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "branch", "diff" },
    lualine_z = { 'encoding', 'fileformat', 'filetype' },
  },
})
