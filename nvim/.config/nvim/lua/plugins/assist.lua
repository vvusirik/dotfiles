return {
	-- "vvusirik/assist.nvim",
	dir = "/home/vvusirik/Projects/assist.nvim",
	config = function()
		require("assist").setup({})
	end,
	dependencies = { "rcarriga/nvim-notify" },
	keys = {
		{ "<M-g>", ":AssistSelect<cr>", mode = "v", desc = "Prompt and replace highlighted text" },
		{ "<M-g>", ":AssistInsert<cr>", mode = "n", desc = "Prompt to generate code" },
		{ "<M-m>", ":AssistMulti<cr>", mode = "n", desc = "Prompt to generate code with entries in qflist" },
		{ "<M-a>", ":AssistAsk<cr>", mode = { "v", "n" }, desc = "Ask a question" },
		{ "<M-e>", ":AssistExplain<cr>", mode = { "v" }, desc = "Explain a code snippet" },
		{ "<M-c>", ":AssistComplete<cr>", mode = { "v", "n" }, desc = "Ask a question" },
	},
}
