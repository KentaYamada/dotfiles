--
-- Neovim options
--
-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lang provider
vim.g.loaded_perl_provider = 0 -- Perl providerを無効化
vim.g.loaded_ruby_provider = 0 -- Ruby providerを無効化

-- 表示
vim.opt.number = true -- 行番号の表示
vim.opt.cursorline = true -- カーソル位置表示
vim.opt.signcolumn = "yes" -- 目印桁の表示
vim.opt.showmatch = true -- カーソルがあたっているカッコに対応するカッコを強調表示
vim.opt.lazyredraw = true -- 再描画の抑制 (高速化)
vim.opt.termguicolors = true -- 24ビットカラー必須
vim.opt.showmode = false -- lualineを利用するため、無効化
vim.opt.title = true -- 編集中のタイトル表示
vim.opt.wrap = false -- 折り返さない
vim.opt.list = true -- 不可視文字を表示
-- 不可視文字の表示に使う文字を設定
vim.opt.listchars = {
  tab = ">>",
  trail = "-",
  nbsp = "+",
}
vim.opt.ambiwidth = "double" -- 曖昧幅の解消
vim.opt.background = "dark"
vim.cmd("colorscheme desert")

-- 検索
vim.opt.hlsearch = true -- ハイライトサーチ
vim.opt.incsearch = true -- インクリメンタルサーチ
vim.opt.ignorecase = true -- 検索時に大文字、小文字を区別しない (fuzzy)
vim.opt.smartcase = true -- 検索文字列に大文字、小文字が混在した場合は、区別して検索
vim.opt.wrapscan = true -- 検索候補の最後尾にたどり着いたら先頭へ戻る

-- 分割
vim.opt.splitright = true -- 分割位置を右に
vim.opt.splitbelow = true -- 水平方向へ分割する場合、下に開くようにする

-- ファイル操作
vim.opt.autoread = true -- 編集中のファイルがvim外部で変更された場合、自動的にリロード
vim.opt.confirm = true -- 保存されていないファイルがあるときに保存の確認をする
vim.opt.backup = false -- バックアップ無効
vim.opt.writebackup = false
vim.opt.swapfile = false -- swap無効
vim.opt.wildmode = "longest:full,full"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400

-- 文字コード
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = {
  "utf-8",
  "euc-jp",
  "sjis",
  "iso-2022-jp",
}
vim.opt.fileformats = {
  "unix",
  "mac",
  "dos",
}

-- インデント
vim.opt.expandtab = true -- スペースでのインデント
vim.opt.shiftwidth = 2 -- << >>で動く幅
vim.opt.tabstop = 2
vim.opt.autoindent = true -- 改行時に前の行のインデントを継続
vim.opt.smartindent = true -- 言語別のインデントを適用する

-- 編集
vim.opt.mouse = "" -- マウス無効化
vim.opt.clipboard:append({ "unnamed", "unnamedplus" }) -- クリップボード共有

-- 履歴
vim.opt.history = 50 -- 履歴保持数

-- Quickfix
vim.opt.cmdheight = 1 -- 画面最下部のメッセージ表示行数
vim.opt.showcmd = true -- コマンド表示

-- スペルチェック (only English)
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

vim.opt.visualbell = false -- ビープ音を無効化

-- `ripgrep`がインストールされていたら、grepツールを`ripgrep`へ置き換え
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case --hiden"
  vim.opt.grepformat = { "%f:%l:%c:%m" }
end

-- `netrw`を無効化
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
