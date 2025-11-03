-- terminalモードで開く
vim.api.nvim_create_user_command('ShowTerminal', 'split | wincmd j | resize 15 | terminal <args>', { nargs = '*' })
