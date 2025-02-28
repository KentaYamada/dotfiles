-- terminalモードで開く
vim.api.nvim_create_user_command('ShowTerminal', 'split | wincmd j | resize 15 | terminal <args>', { nargs = '*' })

-- vimgrepにripgrepを使う
vim.cmd [[
if executable("rg")
    let &grepprg = "rg --vimgrep"
    set grepformat=%f:%l%c:%m
endif
]]
