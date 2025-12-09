return {
	"vimwiki/vimwiki",
	name = "vimwiki",
	event = "BufEnter *.md",
	keys = { "<leader>ww", "<leader>wt", "<leader>w<leader>w" },
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/wiki/",
				auto_diary_index = 1,
				syntax = "markdown",
				ext = "md",
			},
		}
		vim.g.vimwiki_listsyms = "✗○◐●✓"
		vim.g.vimwiki_autoheader = 1
	end,
}
