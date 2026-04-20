return {
	-- "vvusirik/assist.nvim",
	dir = "/home/vvusirik/Projects/assist.nvim",
	config = function()
		require("assist").setup({})
	end,
	keys = {
		{ "<M-a>", ":AssistSelect<cr>", mode = "v", desc = "Prompt and replace highlighted text" },
		{ "<M-a>", ":AssistInsert<cr>", mode = "n", desc = "Prompt to generate code" },
		{ "<M-m>", ":AssistMulti<cr>", mode = "n", desc = "Prompt to generate code with entries in qflist" },
		{ "<M-q>", ":AssistAsk<cr>", mode = { "v", "n" }, desc = "Ask a question" },
	},
}
