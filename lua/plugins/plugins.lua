vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("navarasu/onedark.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("tomtom/tcomment_vim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use("gpanders/editorconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("airblade/vim-gitgutter")
	use("airblade/vim-rooter")
	use("Townk/vim-autoclose")
	use({ "L3MON4D3/LuaSnip", tag = "v1.1.*" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use("rafamadriz/friendly-snippets")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
end)
