--
-- Key mappings
--
-- Disable key maps
vim.keymap.set("n", "q:", "<Nop>", { noremap = true })
vim.keymap.set("n", "ZZ", "<Nop>", { noremap = true })
vim.keymap.set("n", "ZQ", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Up>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Right>", "<Nop>", { noremap = true })

-- normal mode mappings
vim.keymap.set(
  "n",
  "<leader>re",
  ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;",
  { noremap = true, silent = true, desc = "カーソルにある単語を置換" }
)
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true, desc = "ハイライト解除" })
vim.keymap.set("n", "+", "<C-a>", { noremap = true, desc = "インクリメント" })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, desc = "デクリメント" })
vim.keymap.set("n", "p", "]p", { noremap = true })
vim.keymap.set("n", "P", "]P", { noremap = true })
vim.keymap.set(
  "n",
  "vn",
  ":vs +enew<CR>",
  { noremap = true, silent = true, desc = "新規バッファを垂直分割で開く" }
)
vim.keymap.set(
  "n",
  "sn",
  ":sp +enew<CR>",
  { noremap = true, silent = true, desc = "新規バッファを水平分割で開く" }
)
vim.keymap.set(
  "n",
  "tx",
  "<CMD>ShowTerminal<CR>",
  { noremap = true, silent = true, desc = "ターミナルを垂直分割で開く" }
)
vim.keymap.set("n", "tnw", ":<C-u>tabnew<CR>", { noremap = true, silent = true, desc = "新規タブを開く" })
vim.keymap.set("n", "tc", ":<C-u>tabclose<CR>", { noremap = true, silent = true, desc = "タブを閉じる" })
vim.keymap.set("n", "tn", "gt", { noremap = true, silent = true, desc = "次のタブへ移動" })
vim.keymap.set("n", "tp", "gT", { noremap = true, silent = true, desc = "前のタブへ移動" })

-- insert mode
vim.keymap.set("i", "(", "()<LEFT>", { noremap = true })
vim.keymap.set("i", "{", "{}<LEFT>", { noremap = true })
vim.keymap.set("i", "{<Enter>", "{}<Left><CR><ESC><S-o>", { noremap = true })
vim.keymap.set("i", "[", "[]<LEFT>", { noremap = true })
vim.keymap.set("i", '"', '""<LEFT>', { noremap = true })
vim.keymap.set("i", "'", "''<LEFT>", { noremap = true })

-- reload `init.lua`
local function reload_my_conf()
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("`init.lua` reloaded!", vim.log.levels.INFO)
end

vim.keymap.set(
  "n",
  "<leader><leader>",
  reload_my_conf,
  { noremap = true, silent = true, desc = "init.lua再読み込み" }
)

-- terminal mode mappings
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "ノーマルモードにする(terminal mode)" })

-- command mode mappings
-- アクティブなファイルのディレクトリを展開
vim.keymap.set("c", "%%", function()
  return vim.fn.getcmdtype() == ":" and vim.fn.expand("%:h") .. "/" or "%%"
end, { expr = true, desc = "アクティブファイルのディレクトリを展開" })
