-- Splits and Tabs Configuration for Neovim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Split behavior
vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right

-- Key mappings for navigating splits
map('n', '<C-h>', '<C-w>h', opts) -- Navigate to the left split
map('n', '<C-l>', '<C-w>l', opts) -- Navigate to the right split
map('n', '<C-j>', '<C-w>j', opts) -- Navigate to the split below
map('n', '<C-k>', '<C-w>k', opts) -- Navigate to the split above

-- Create a new vertical split
map('n', '<C-s>', ':vnew<CR>', opts)

-- Tabs
map('n', '<C-t>', ':tab split<CR>', opts) -- Focus current buffer in new tab
map('n', '<C-Tab>', 'gt', opts)           -- Navigate to the next tab
map('n', '<C-S-Tab>', 'gT', opts)         -- Navigate to the previous tab
