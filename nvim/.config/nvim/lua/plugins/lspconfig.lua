local on_attach = function(client, bufnr)
	local keymap = function(mode, keys, func, opts)
		opts.buffer = bufnr
		vim.keymap.set(mode, keys, func, opts)
	end

	keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
	keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
	keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
	keymap("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
	keymap("n", "gr", vim.lsp.buf.references, { desc = "List references" })

	keymap("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "List document symbols" })
	keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "List workspace symbols" })

	keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
	keymap("n", "gK", vim.lsp.buf.signature_help, { desc = "Show signature" })
	keymap("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature" })

	keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

	keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
	keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
	keymap("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = "List workspace folders" })
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	ft = { "lua", "rust", "python", "javascript", "typescriptreact" },
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
		lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
		lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
		lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
		lspconfig.emmet_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
	end,
}
