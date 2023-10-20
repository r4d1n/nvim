require("elixir").setup()

-- Setup lspconfig
require("lspconfig").tsserver.setup({})
require("lspconfig").graphql.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").prismals.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").html.setup({ filetypes = { "html", "handlebars" } })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = false,
	-- float = true,
})
