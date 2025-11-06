--
-- formatter
-- see: https://github.com/stevearc/conform.nvim
--
local config = {
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 2000, -- 2 seconds
	},
}
local conform = require("conform")

conform.setup(config)
