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
require("luasnip").filetype_extend("typescript", { "javascript" })

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_on_attach = function(_, bufnr)
	-- it would be better to handle this in the treesitter setup directly
	if vim.api.nvim_buf_line_count(bufnr) < 30000 then
		vim.o.foldmethod = "expr"
		vim.o.foldcolumn = "auto"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"
		vim.o.foldenable = false -- Disable folding at startup.
	end
end

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = lsp_on_attach,
})
require("lspconfig").graphql.setup({
	capabilities = capabilities,
	on_attach = lsp_on_attach,
})
require("lspconfig").sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = lsp_on_attach,
})
require("lspconfig").prismals.setup({
	capabilities = capabilities,
	on_attach = lsp_on_attach,
})

local lsp_format = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name ~= "tsserver"
		end,
		bufnr = bufnr,
	})
end

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		-- require("null-ls").builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "json" },
		}),
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.prismaFmt
		require("typescript.extensions.null-ls.code-actions"),
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_format(bufnr)
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

return { format = lsp_format }
