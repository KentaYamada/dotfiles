--
-- File browser plugin config
-- see: https://github.com/nvim-tree/nvim-tree.lua
-- WARN: telescope file browserへ移行予定
--
local tree = require("nvim-tree")
local config = {
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  sort = {
    sorter = "case_sensitive",
    folders_first = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = "icon",
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
      git_placement = "before",
    },
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = {
      -- ignore .git, but not .github
      "\\.git\\(\\(hub\\)\\@!\\)",
      "^node_modules",
    },
  },
  git = {
    enable = true,
  },
  view = {
    width = 35,
    signcolumn = "yes",
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function build_opts(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        buffer = bufnr,
        desc = "File browser: " .. desc,
      }
    end

    -- attach default key mapings on buffer
    api.config.mappings.default_on_attach(bufnr)

    -- user key mappings
    vim.keymap.set("n", "?", api.tree.toggle_help, build_opts("Help"))
  end,
}
tree.setup(config)

-- Key mappings
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, {
  silent = true,
  noremap = true,
  desc = "Toggle file browser",
})
