local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local utils = require "telescope.utils"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

custom_pickers = {}

custom_pickers.worktrees = function(opts)
    opts = opts or {}

    -- Populate worktree list
    local out, _, _ = utils.get_os_command_output({"git", "worktree", "list"}, opts.cwd)
    local worktree_list = {}
    for key, value in pairs(out) do
        worktree_list[key] = vim.split(value, " ")[1]
    end

    pickers.new(
        opts,
        {
            prompt_title = "Git Worktrees",
            finder = finders.new_table {results = worktree_list},
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(
                    function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        vim.cmd("cd " .. selection[1])
                        print("Changed worktree to " .. selection[1])
                        vim.cmd("enew")
                    end
                )
                -- TODO: mappings for removing worktrees
                return true
            end
        }
    ):find()
end

return custom_pickers
