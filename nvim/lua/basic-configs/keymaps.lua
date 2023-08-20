-- Modes
-- nomal mode: 'n'
-- insert mode: 'i'
-- visual mode: 'v'
-- visual block mode: 'x'
-- terminal mode: 't'
-- command mode: 'c'

-- Reference
-- https://github.com/neovim/neovim/commit/6d41f65aa45f10a93ad476db01413abaac21f27d

-- map leader (default: \)
vim.g.mapleader = ' '

-- Disable keymaps
vim.keymap.set('n', 'q:', '<Nop>', { noremap = true })
vim.keymap.set('n', 'ZZ', '<Nop>', { noremap = true })
vim.keymap.set('n', 'ZQ', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Right>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Right>', '<Nop>', { noremap = true })

vim.keymap.set('n', '<leader><leader>', ':source $MYVIMRC<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<ESC><ESC>', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '+', '<C-a>', { noremap = true })
vim.keymap.set('n', '-', '<C-x>', { noremap = true })
-- Paste
vim.keymap.set('n', 'p', ']p', { noremap = true })
vim.keymap.set('n', 'P', ']P', { noremap = true })
-- Open new buffer
vim.keymap.set('n', 'vn', ':vs +enew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'sn', ':sp +enew<CR>', { noremap = true, silent = true })
-- Open terminal
vim.keymap.set('n', 'tx', '<CMD>ShowTerminal<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tv', '<CMD>vertical rightbelow new<CR><CMD>terminal<CR>', { noremap = true, silent = true })
-- Replace the cursor word
-- cocと被ってる？
vim.keymap.set('n', '<leader>re', ':%s;\\<<C-R><C-W>\\>;g<Left><Left>;', { noremap = true, silent = true })

vim.keymap.set('i', '(', '()<left>', { noremap = true, silent = true })
vim.keymap.set('i', '[', '[]<left>', { noremap = true, silent = true })
vim.keymap.set('i', '{', '{}<left>', { noremap = true, silent = true })

-- Tab operations keymaps
vim.keymap.set('n', 'tnw', ':<C-u>tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tc', ':<C-u>tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tn', 'gt', { noremap = true, silent = true })
vim.keymap.set('n', 'tp', 'gT', { noremap = true, silent = true })

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- アクティブなファイルのディレクトリを展開
vim.keymap.set('c', '%%', function()
    return vim.fn.getcmdtype() == ':' and vim.fn.expand('%:h')..'/' or '%%'
end, { expr = true })
