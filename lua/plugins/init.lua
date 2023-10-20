return {
	"neovim/nvim-lspconfig",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "echasnovski/mini.nvim", version = "*" },
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
	"airblade/vim-gitgutter",
	"airblade/vim-rooter",
	"jose-elias-alvarez/typescript.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "elixir-tools/elixir-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
