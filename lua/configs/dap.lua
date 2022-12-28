require("dap-vscode-js").setup({
	adapters = { "pwa-node" },
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			-- address = "ws://0.0.0.0",
			address = "127.0.0.",
			-- processId = require("dap.utils").pick_process,
			port = 9229,
			cwd = "${workspaceFolder}",
		},
	}
end
