require("mini.comment").setup()
require("mini.operators").setup()
require("mini.surround").setup()
require("mini.hipatterns").setup()

require("mini.completion").setup()
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
