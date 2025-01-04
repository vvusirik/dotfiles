return {
    "NeogitOrg/neogit",
    keys = {
        { '<Leader>gs', '<cmd>Neogit<cr>', desc = 'Open Nvim Tree' },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
}
