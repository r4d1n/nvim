vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set shiftwidth=4 ]])
vim.cmd([[ set softtabstop=4 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])
vim.cmd([[ set bg=light ]])
vim.cmd([[ set termguicolors ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- change cursor based on mode
au({ "InsertEnter" }, { pattern = "*", command = "set cul" })
au({ "InsertLeave" }, { pattern = "*", command = "set nocul" })

---Highlight yanked text
au("TextYankPost", {
	group = ag("yank_highlight", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

vim.cmd.colorscheme("catppuccin")
