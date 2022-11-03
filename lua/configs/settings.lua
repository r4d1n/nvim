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
vim.cmd([[
  let g:onedark_style = 'light'
  colorscheme onedark
]])

vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])

-- change cursor based on mode
vim.api.nvim_create_autocmd(
  { "InsertEnter" },
  { pattern = "*", command = "set cul" }
)
vim.api.nvim_create_autocmd(
  { "InsertLeave" },
  { pattern = "*", command = "set nocul" }
)


-- telescope
vim.cmd([[nnoremap <Leader>f :lua require'telescope.builtin'.find_files{}]])
vim.cmd([[nnoremap \ :lua require'telescope.builtin'.live_grep{}]])
vim.cmd([[nnoremap <Leader>j :lua require'telescope.builtin'.grep_string{}]])

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

