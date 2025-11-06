--
-- crates.nvim plugin config
-- See: https://github.com/saecki/crates.nvim/wiki
--
local crates = require("crates")
local config = {
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
	completion = {
		crates = {
			enabled = true,
			max_results = 8,
			min_chars = 3,
		},
	},
}
crates.setup(config)
