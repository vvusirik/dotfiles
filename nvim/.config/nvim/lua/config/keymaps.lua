-- Keymaps configuration for Neovim using Lua

-- Function to simplify keymap setting
local keymap = function(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Normal mode keymaps
keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true })
keymap('n', '<Leader>siv', ':source $MYVIMRC | Lazy sync<CR>', { noremap = true })
keymap('n', '<Leader>ev', ':e $MYVIMRC<CR>', { noremap = true })
keymap('n', '<Leader>ea', ':e ~/.bash_aliases<CR>', { noremap = true })
keymap('n', '<Leader>ec', ':e ~/dotfiles/nixos/configuration.nix<CR>', { noremap = true })
keymap('n', 'ZA', ':qa<CR>', { noremap = true })
keymap('n', '<Leader>s', ':w<CR>', { noremap = true })
keymap('n', 'Y', 'y$', { noremap = true })
keymap('n', 'n', 'nzzzv', { noremap = true })
keymap('n', 'N', 'Nzzzv', { noremap = true })
keymap('n', 'J', 'mzJ`z', { noremap = true })
keymap('n', '<Tab>', '%', { noremap = true })
keymap('n', '+', '*N', { noremap = true })
keymap('n', '-', '*Ncgn', { noremap = true })

-- Visual mode keymaps
keymap('v', '<Leader>p', '"_dP', { noremap = true })

-- Insert mode keymaps
keymap('i', ',', ',<C-g>u', { noremap = true })
keymap('i', '.', '.<C-g>u', { noremap = true })
keymap('i', '!', '!<C-g>u', { noremap = true })
keymap('i', '?', '?<C-g>u', { noremap = true })
keymap('i', '<C-j>', '<C-o>:m .+1<CR>', { noremap = true })
keymap('i', '<C-k>', '<C-o>:m .-2<CR>', { noremap = true })

-- Quickfix/Location List navigation
keymap('n', '<Leader>q', ':call ToggleQuickfixList()<CR>', { noremap = true })
keymap('n', '<Leader>l', ':call ToggleLocationList()<CR>', { noremap = true })
keymap('n', '<Leader>qk', ':cprev<CR>zzzv', { noremap = true })
keymap('n', '<Leader>qj', ':cnext<CR>zzzv', { noremap = true })
keymap('n', '<Leader>lk', ':lprev<CR>zzzv', { noremap = true })
keymap('n', '<Leader>lj', ':lnext<CR>zzzv', { noremap = true })
