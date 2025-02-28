--
-- crates.nvim plugin config
-- See: https://github.com/saecki/crates.nvim/wiki
--
local options = {
    completion = {
        crates = {
            enabled = true,
            max_results = 8,
            min_chars = 3,
        }
    }
}
local crates = require('crates')

crates.setup(options)
