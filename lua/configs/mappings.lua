vim.g.mapleader = " "

-- telescope
vim.cmd([[nnoremap <Leader>f :lua require'telescope.builtin'.find_files{} <CR>]])
vim.cmd([[nnoremap <Leader>\ :lua require'telescope.builtin'.live_grep{} <CR>]])
vim.cmd([[nnoremap <Leader>g :lua require'telescope.builtin'.grep_string{} <CR>]])
