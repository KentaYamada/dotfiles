--
-- rust analyzer config
-- LSP config reference: https://rust-analyzer.github.io/book/configuration.html
--
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
}
