local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local putils = require "telescope.previewers.utils"
local make_entry = require "telescope.make_entry"
local previewers = require "telescope.previewers"
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
        worktree_list[key] = value
    end

    pickers.new(
        opts,
        {
            prompt_title = "Git Worktrees",
            finder = finders.new_table { results = worktree_list },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(
                    function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        local dir = vim.split(selection[1], " ")[1]
                        -- Change into worktree directory
                        vim.cmd("cd " .. dir)
                        print("Changed worktree to " .. dir)
                        -- set a blank buffer in the new workspace
                        vim.cmd("enew")
                    end
                )
                -- TODO: mappings for removing worktrees
                return true
            end
        }
    ):find()
end

custom_pickers.worktrees()

return custom_pickers
