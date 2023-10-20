require("elixir").setup()

-- require("lspconfig").tsserver.setup({}) -- commented in favor of the typescript tools plugin
require("lspconfig").eslint.setup({})
require("lspconfig").graphql.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").prismals.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").html.setup({ filetypes = { "html", "handlebars" } })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = false,
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
