return {
	-- Formatter engine
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			-- Keybindings for formatting
			vim.api.nvim_set_keymap(
				"n",
				"<leader>f",
				"<cmd>lua require('conform').format()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>f",
				"<cmd>lua require('conform').format({range = true})<CR>",
				{ noremap = true, silent = true }
			)
			require("conform").setup({
				format_on_save = {
					timeout_ms = 1000,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					python = { "isort", "black" },
					javascript = { "prettierd" },
					lua = { "stylua" },
				},
				formatters = {
					black = {
						command = vim.fn.stdpath("data") .. "/mason/bin/black",
					},
					isort = {
						command = vim.fn.stdpath("data") .. "/mason/bin/isort",
					},
					stylua = {
						command = vim.fn.stdpath("data") .. "/mason/bin/stylua",
					},
					prettierd = {
						command = vim.fn.stdpath("data") .. "/mason/bin/prettierd",
					},
				},
			})
		end,
	},

	-- Bridge Mason and null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"black",
					"isort",
					"stylua",
					"prettierd",
				},
				automatic_installation = true,
			})
		end,
	},

	-- Register the actual formatters for conform to use via null-ls
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Python
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,

					-- JavaScript
					null_ls.builtins.formatting.prettierd,

					-- Lua
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}
