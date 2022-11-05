require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "javascript", "typescript", "tsx", "json", "lua" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	-- auto_install = true,
	-- Install parsers synchronously (only applied to `ensure_installed`)
	-- sync_install = false,

	highlight = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
})

vim.o.foldmethod = "expr"
vim.o.foldcolumn = "auto"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false -- Disable folding at startup.
