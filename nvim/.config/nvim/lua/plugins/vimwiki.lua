return {
	"vimwiki/vimwiki",
	name = "vimwiki",
	lazy = false,
	keys = {
		"<leader>ww",
		"<leader>wt",
		"<leader>w<leader>w",
		{
			"<C-Space>",
			"<Plug>VimwikiToggleListItem",
			desc = "Toggle vimwiki list item",
		},
		{
			"<leader>to",
			"<cmd>e ~/wiki/todo.md<cr>",
			desc = "Open todo list",
		},
	},
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
		vim.g.vimwiki_global_ext = 1
	end,
}
