-- カーソル行の表示
vim.opt.cursorline = true
-- 画面右下にカーソル位置を表示
vim.opt.ruler = true
-- 行番号の表示
vim.opt.number = true
-- カーソルがあたっているカッコに対応するカッコを強調表示
vim.opt.showmatch = true
-- 不可視文字を表示
vim.opt.list = true
-- 不可視文字の表示に使う文字を設定
vim.opt.listchars = {tab='>-', trail='-', nbsp='%'}
-- ステータスラインを常に表示 (0: never, 1: more than two windows, 2: always)
vim.opt.laststatus = 2
-- コマンド表示
vim.opt.showcmd = true
-- 画面最下部のメッセージ表示行数
vim.opt.cmdheight = 2
-- 目印桁の表示
vim.opt.signcolumn = 'yes'
-- 編集中のファイルがvim外部で変更された場合、自動的にリロード
vim.opt.autoread = true
-- 保存されていないファイルがあるときに保存の確認をする
vim.opt.confirm = true
-- ディレクトリの区切り文字をスラッシュにする(for Windows)
vim.opt.shellslash = true
-- 曖昧幅の解消
vim.opt.ambiwidth = 'double'
-- スペースのインデント
vim.opt.expandtab = true
-- インデント幅
vim.opt.tabstop = 4
-- 自動インデント幅
vim.opt.shiftwidth = 4
-- 改行時に前の行のインデントを継続
vim.opt.autoindent = true
-- 改行したときに次の行を自動的にインデントする
vim.opt.smartindent = true
-- バックアップファイルを作成しない
vim.opt.backup = false
vim.opt.writebackup = false
-- スワップファイルを作成しない
vim.opt.swapfile = false
-- 編集中のタイトル表示
vim.opt.title = true
-- ハイライトサーチ
vim.opt.hlsearch = true
-- インクリメンタルサーチ
vim.opt.incsearch = true
-- 検索時に大文字、小文字を区別しない (fuzzy)
vim.opt.ignorecase = true
-- 検索文字列に大文字、小文字が混在した場合は、区別して検索
vim.opt.smartcase = true
-- 検索候補の最後尾にたどり着いたら先頭へ戻る
vim.opt.wrapscan = true
-- 水平方向へ分割する場合、下に開くようにする
vim.opt.splitbelow = true
-- 
vim.opt.wildmenu = true
-- 履歴の保持数
vim.opt.history = 50
-- デフォルトカラースキーム
vim.cmd 'colorscheme desert'
vim.opt.background = 'dark'

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.termencoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'euc-jp', 'sjis', ' iso-2022-jp' }
vim.opt.fileformats = { 'unix', 'dos', 'mac' }

vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.mouse = '' -- disable mouse
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.visualbell = false
