return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = function()
        local lazy_telescope = function(builtin)
            return function(...)
                require('telescope.builtin')[builtin](...)
            end
        end
        return {
            { '<C-b>', lazy_telescope('buffers'),                   desc = 'Find buffers' },
            { '<C-p>', lazy_telescope('git_files'),                 desc = 'Find Git files' },
            { '<C-P>', lazy_telescope('find_files'),                desc = 'Find files' },
            { '<C-/>', lazy_telescope('current_buffer_fuzzy_find'), desc = 'Find fuzzy match in current buffer' },
            { '<C-y>', lazy_telescope('live_grep'),                 desc = 'Find files by content' },
            -- { '<C-h>', lazy_telescope('help_tags'),                 desc = 'Find help tags' },
            -- { '<C-o>', lazy_telescope('oldfiles'),                  desc = 'Find recently opened files' },
            -- { '<C-w>', lazy_telescope('grep_string'),               desc = 'Find word in buffer' },
            -- { '<C-d>', lazy_telescope('diagnostics'),               desc = 'Find diagnostics' },
        }
    end,
    config = true,
}