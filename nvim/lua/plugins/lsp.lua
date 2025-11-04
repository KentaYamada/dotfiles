--
-- Language Server Protocol
-- (Neovim >= v0.11)
--

-- Mason (package manager)
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local servers = {
	"clangd",
	"eslint",
	"lua_ls",
	"pylsp",
	"rust_analyzer",
	"stylua",
	"ts_ls",
	"vimls",
}
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

mason_lspconfig.setup({
	ensure_installed = servers,
})

vim.lsp.config("*", { capabilities = capabilities })

-- Lua (Neovim dev friendly)
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telementry = { enable = true },
		},
	},
})

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	filetypes = { "rust" },
	settings = {
		["rust_analyzer"] = {
			check = { command = "clippy" },
		},
	},
})

-- Diagnostic
vim.diagnostic.config({
	serverity_sort = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	virtual_text = false,
})

-- LSP有効化
vim.lsp.enable(servers)

-- ヒント表示
vim.lsp.inlay_hint.enable(true)

-- Key mappings
-- Global diagnostic key mappings
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "宣言にジャンプ" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "定義にジャンプ" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "ホバー表示" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "リネーム" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("FormatOnSave", {}),
			buffer = ev.buf,
			callback = function()
				-- only if server supports formatting
				local clients = vim.lsp.get_clients({ buffer = ev.buf })
				for _, client in ipairs(clients) do
					if client.supports_method("textDocument/formatting") then
						vim.lsp.buf.format({ async = false })
						return
					end
				end
			end,
		})
	end,
})
