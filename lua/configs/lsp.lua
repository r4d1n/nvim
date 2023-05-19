local cmp = require("cmp")

require("elixir").setup()
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
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})
require("lspconfig").graphql.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({ capabilities = capabilities })
require("lspconfig").prismals.setup({ capabilities = capabilities })
require("lspconfig").tailwindcss.setup({})
require("lspconfig").html.setup({ filetypes = { "html", "handlebars" } })

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
			filetypes = { "json", "handlebars" },
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
