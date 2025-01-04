-- Insert closing pairs for parens
return {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
        { '<C-t>',      ':$tabnew<CR> ',      desc = 'Open new tab' },
        { '<Leader>tr', ':Tabby rename_tab ', desc = 'Rename a tab' },
        { '<C-Tab>',    'gt',                 desc = 'Next Tab' },
        { '<C-S-Tab>',  'gT',                 desc = 'Previous Tab' },
    },
    config = true
}
