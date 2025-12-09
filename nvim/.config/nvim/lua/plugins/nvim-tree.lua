return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<M-n>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Open Nvim Tree" },
	},
	opts = {
		hijack_netrw = true,
		update_cwd = true,
		update_focused_file = { enable = true },
	},
}
