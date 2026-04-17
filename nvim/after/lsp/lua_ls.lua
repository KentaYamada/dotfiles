--
-- lua_ls config
-- Neovim & Wezterm friendly
-- See: https://luals.github.io/wiki/settings/
--
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telementry = { enable = true },
    },
  },
}
