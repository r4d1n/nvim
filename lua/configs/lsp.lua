local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- require("lspconfig").tsserver.setup({ capabilities = cmp.capabilities }) -- commented in favor of the typescript tools plugin
require("lspconfig").eslint.setup({ capabilities = capabilities })
require("lspconfig").graphql.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({ capabilities = capabilities })
require("lspconfig").prismals.setup({ capabilities = capabilities })
require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
require("lspconfig").html.setup({ filetypes = { "html", "handlebars" } })
require("lspconfig").rust_analyzer.setup({})

require("elixir").setup({
	nextls = {
		enable = true,
		init_options = {
			experimental = {
				completions = {
					enable = true, -- control if completions are enabled. defaults to false
				},
			},
		},
	},
	credo = { enable = true },
	elixirls = { enable = false },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = false,
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
