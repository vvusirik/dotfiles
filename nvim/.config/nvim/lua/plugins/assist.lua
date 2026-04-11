return {
	-- "vvusirik/assist.nvim",
	dir = "/home/vvusirik/Projects/assist.nvim",
	config = function()
		require("assist").setup({})
	end,
	keys = {
		{ "<leader>as", ":AssistSelect<cr>", mode = "v", desc = "Prompt and replace highlighted text" },
		{ "<leader>ai", ":AssistInsert<cr>", mode = "n", desc = "Prompt to generate code" },
		{ "<leader>aq", ":AssistMulti<cr>", mode = "n", desc = "Prompt to generate code with entries in qflist" },
	},
}
