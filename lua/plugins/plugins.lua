vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'tomtom/tcomment_vim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'editorconfig/editorconfig-vim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'airblade/vim-gitgutter'
    use 'airblade/vim-rooter'
    use 'Townk/vim-autoclose'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
