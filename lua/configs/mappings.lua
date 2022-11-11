vim.g.mapleader = " "

vim.cmd([[nnoremap rn :lua vim.lsp.buf.rename()<CR>]])
vim.cmd([[nnoremap gd :lua vim.lsp.buf.definition()<CR>]])

-- telescope
vim.cmd([[nnoremap <Leader>f :lua require'telescope.builtin'.find_files{} <CR>]])
vim.cmd([[nnoremap <Leader>rg :lua require'telescope.builtin'.live_grep{} <CR>]])
vim.cmd([[nnoremap <Leader>gs :lua require'telescope.builtin'.grep_string{} <CR>]])

-- lsp and diagnostic windows
vim.cmd([[nnoremap <C-k> :lua vim.lsp.buf.hover()<CR>]])
vim.cmd([[nnoremap <C-l> :lua vim.diagnostic.open_float({ scope = "line" }) <CR>]])
