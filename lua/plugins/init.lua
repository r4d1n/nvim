return {
	"neovim/nvim-lspconfig",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"nvim-lua/plenary.nvim",
	-- { "echasnovski/mini.nvim", version = false },
	{ "r4d1n/mini.nvim", version = false, dir = "~/workspace/mini.nvim" },
	"nvim-tree/nvim-web-devicons",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"stevearc/conform.nvim",
	"lewis6991/gitsigns.nvim",
	"airblade/vim-rooter",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "elixir-tools/elixir-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
