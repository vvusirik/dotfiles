custom_pickers = {}
custom_pickers.worktrees = function(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local utils = require("telescope.utils")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	opts = opts or {}

	-- Populate worktree list
	local out, _, _ = utils.get_os_command_output({ "git", "worktree", "list" }, opts.cwd)

	local worktree_list = {}
	for key, value in pairs(out) do
		worktree_list[key] = value
	end

	pickers
		.new(opts, {
			prompt_title = "Git Worktrees",
			finder = finders.new_table({ results = worktree_list }),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local dir = vim.split(selection[1], " ")[1]
					-- Change into worktree directory
					vim.cmd("cd " .. dir)
					print("Changed worktree to " .. dir)
					-- set a blank buffer in the new workspace
					vim.cmd("enew")
				end)
				-- TODO: mappings for removing worktrees
				return true
			end,
		})
		:find()
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = function()
		local lazy_telescope = function(builtin, opts)
			return function()
				require("telescope.builtin")[builtin](opts or {})
			end
		end
		return {
			{ "<C-b>", lazy_telescope("buffers"), desc = "Find buffers" },
			{ "<C-p>", lazy_telescope("git_files", { show_untracked = true }), desc = "Find Git files" },
			{ "<C-S-P>", lazy_telescope("find_files", { hidden = true }), desc = "Find files" },
			{
				"<C-/>",
				lazy_telescope("current_buffer_fuzzy_find"),
				desc = "Find fuzzy match in current buffer",
			},
			{ "<C-y>", lazy_telescope("live_grep"), desc = "Find files by content" },
			{ "<C-d>", lazy_telescope("diagnostics"), desc = "Find diagnostics" },
			{
				"<M-w>",
				function()
					custom_pickers.worktrees({})
				end,
				desc = "Find diagnostics",
			},
			{ "<C-k>", lazy_telescope("keymaps"), desc = "Fuzzy search keymaps" },
			-- { '<C-h>', lazy_telescope('help_tags'),                 desc = 'Find help tags' },
			-- { '<C-o>', lazy_telescope('oldfiles'),                  desc = 'Find recently opened files' },
			-- { '<C-w>', lazy_telescope('grep_string'),               desc = 'Find word in buffer' },
		}
	end,
	config = true,
}
