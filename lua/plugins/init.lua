return {
	"neovim/nvim-lspconfig",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "echasnovski/mini.nvim", version = "*" },
  'stevearc/conform.nvim',
	"airblade/vim-gitgutter",
	"airblade/vim-rooter",
	"jose-elias-alvarez/typescript.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "elixir-tools/elixir-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
