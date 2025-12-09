return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
	keys = {
		{ "<leader>coe", "<cmd>Copilot enable<cr>", desc = "Enable Copilot Assistant" },
		{ "<leader>cod", "<cmd>Copilot disable<cr>", desc = "Disable Copilot Assistant" },
	},
}
