local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})
require("lspconfig").graphql.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })

vim.cmd([[nnoremap gd :lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[nnoremap K :lua vim.lsp.buf.hover()<CR>]])
-- vim.cmd([[nnoremap <leader>. :lua vim.lsp.buf.code_action()<CR>]])
vim.cmd([[nnoremap rn :lua vim.lsp.buf.rename()<CR>]])

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		-- require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.formatting.eslint_d,
		require("null-ls").builtins.formatting.prettier.with({
			filetypes = { "json" },
		}),
		require("null-ls").builtins.formatting.stylua,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = false,
	-- float = true,
})

vim.cmd([[nnoremap L :lua vim.diagnostic.open_float({ scope = "line" }) <CR>]])
