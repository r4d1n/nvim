vim.g.mapleader = " "

-- telescope
vim.cmd([[nnoremap <Leader>ff :lua require'telescope.builtin'.find_files{} <CR>]])
vim.cmd([[nnoremap <Leader>rg :lua require'telescope.builtin'.live_grep{} <CR>]])
vim.cmd([[nnoremap <Leader>gs :lua require'telescope.builtin'.grep_string{} <CR>]])
