local conform = require("conform")

conform.setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
	formatters_by_ft = {
		javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		rust = { "rustfmt" },
		terraform = { "terraformat" },
	},
})

vim.api.nvim_create_user_command("NoFormat", function(args)
	if args.bang then
		-- NoFormat! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("YesFormat", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.keymap.set("n", "<leader><C-f>", conform.format, { noremap = true, silent = true })
