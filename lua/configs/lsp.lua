local cmp = require'cmp'

cmp.setup({
   snippet = {
      expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      end,
   },
   mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
      if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
   }
})

-- Setup lspconfig.
require('lspconfig').tsserver.setup {
   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.cmd([[nnoremap gd :lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[nnoremap K :lua vim.lsp.buf.hover()<CR>]])
-- vim.cmd([[nnoremap <leader>. :lua vim.lsp.buf.code_action()<CR>]])
-- vim.cmd([[nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>]])

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.formatting.eslint,
        require("null-ls").builtins.formatting.eslint_d,
    },

    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
