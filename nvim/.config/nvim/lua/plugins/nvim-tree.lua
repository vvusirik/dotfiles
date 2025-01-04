return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { '<C-n>', '<cmd>NvimTreeFindFileToggle<cr>', desc = 'Open Nvim Tree' },
    },
    config = function()
        require("nvim-tree").setup {}
    end,
}

