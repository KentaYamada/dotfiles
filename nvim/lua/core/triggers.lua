--
-- Auto commands
--
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ファイルタイプ関連自動コマンド
augroup('CmdFt', {clear = true})
-- `*.config`のファイルタイプをconfigにする
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'CmdFt',
    pattern = {'*.conf'},
    command = 'setfiletype config'
})
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'CmdFt',
    pattern = {'*.toml'},
    command = 'setfiletype config'
})
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'CmdFt',
    pattern = {'*.ts'},
    command = 'setfiletype typescript'
})

-- ターミナルモードの自動コマンド
augroup('CmdTerm', {clear = true})
-- Insert modeにしてTerminalを開く
autocmd({'TermOpen'}, {
    group = 'CmdTerm',
    command = 'startinsert'
})
-- 行番号を非表示
autocmd({'TermOpen'}, {
    group = 'CmdTerm',
    command = 'setlocal nonumber'
})
-- 相対行番号を非表示
autocmd({'TermOpen'}, {
    group = 'CmdTerm',
    command = 'setlocal norelativenumber'
})
