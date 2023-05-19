require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"json",
		"lua",
		"prisma",
		"elixir",
		"erlang",
		"html",
		"heex",
		"eex",
		"glimmer",
	},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	-- auto_install = true,
	-- Install parsers synchronously (only applied to `ensure_installed`)
	-- sync_install = false,

	highlight = {
		enable = true,
		disable = function(_, bufnr)
			return vim.api.nvim_buf_line_count(bufnr) > 30000
		end,
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
	indent = { enable = true },
})
