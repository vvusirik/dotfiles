return {
    "vimwiki/vimwiki",
    name = "vimwiki",
    event = "BufEnter *.md",
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki/',
                auto_diary_index = 1,
                syntax = 'markdown',
                ext = 'md'
            }
        }
        vim.g.vimwiki_listsyms = '✗○◐●✓'
    end,
}
