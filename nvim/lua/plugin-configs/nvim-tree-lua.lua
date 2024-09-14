-- nvim-tree.lua configuration
-- see: https://github.com/nvim-tree/nvim-tree.lua
-- :h nvim-tree

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- local function my_on_attach(bufnr)
--     local api = require 'nvim-tree.api'
-- 
--     local function opts(desc)
--         return { desc = "nvim-tree: "..desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--     end
-- 
--     -- default mappings
--     api.config.mappings.default_on_attach(bufnr)
-- 
--     -- custom mappings
--     vim.keymap.set('n', api.tree.toggle_help, opts('Help'))
-- end

require("nvim-tree").setup {
--     on_attach = my_on_attach,
    filters = {
        git_ignored = false,
        custom = {
            -- ignore .git, but not .github
            "\\.git\\(\\(hub\\)\\@!\\)",
            "^node_modules",
        }
    }
}
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
