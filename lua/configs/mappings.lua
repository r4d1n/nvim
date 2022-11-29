vim.g.mapleader = " "

vim.cmd([[nnoremap rn :lua vim.lsp.buf.rename()<CR>]])
vim.cmd([[nnoremap gd :lua vim.lsp.buf.definition()<CR>]])
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>rg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- lsp and diagnostic windows
vim.cmd([[nnoremap <C-k> :lua vim.lsp.buf.hover()<CR>]])
vim.cmd([[nnoremap <C-l> :lua vim.diagnostic.open_float({ scope = "line" }) <CR>]])
