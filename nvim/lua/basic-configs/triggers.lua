------------------------
-- auto command configs
------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('ConfCmd', {clear = true})
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'ConfCmd',
    pattern = {'*.conf'},
    command = 'setfiletype config'
})

augroup('TermCmd', {clear = true})
autocmd({'TermOpen'}, {
    group = 'TermCmd',
    command = 'startinsert' -- Insert modeにしてTerminalを開く
})
autocmd({'TermOpen'}, {
    group = 'TermCmd',
    command = 'setlocal norelativenumber'
})
autocmd({'TermOpen'}, {
    group = 'TermCmd',
    command = 'setlocal nonumber'
})

augroup('TomlCmd', {clear = true})
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'TomlCmd',
    pattern = {'*.toml'},
    command = 'setfiletype config'
})

augroup('TypeScriptCmd', {clear = true})
autocmd({'BufNewFile', 'BufRead'}, {
    group = 'TypeScriptCmd',
    pattern = {'*.ts'},
    command = 'setfiletype typescript'
})
