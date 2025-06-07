-- Keymaps configuration for Neovim using Lua

-- Function to simplify keymap setting
local keymap = function(mode, lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal mode keymaps
keymap("n", "<Leader>sv", ":source $MYVIMRC<CR>", { noremap = true })
keymap("n", "<Leader>siv", ":source $MYVIMRC | Lazy sync<CR>", { noremap = true })
keymap("n", "<Leader>ev", ":e $MYVIMRC<CR>", { noremap = true })
keymap("n", "<Leader>ea", ":e ~/.bash_aliases<CR>", { noremap = true })
keymap("n", "<Leader>ec", ":e ~/dotfiles/nixos/configuration.nix<CR>", { noremap = true })
keymap("n", "ZA", ":qa<CR>", { noremap = true })
keymap("n", "<Leader>s", ":w<CR>", { noremap = true })
keymap("n", "Y", "y$", { noremap = true })
keymap("n", "n", "nzzzv", { noremap = true })
keymap("n", "N", "Nzzzv", { noremap = true })
keymap("n", "J", "mzJ`z", { noremap = true })
keymap("n", "<Tab>", "%", { noremap = true })
keymap("n", "+", "*N", { noremap = true })
keymap("n", "-", "*Ncgn", { noremap = true })

-- copy file paths
keymap("n", "<Leader>crp", ':let @+ = expand("%")<CR>')
keymap("n", "<Leader>cap", ':let @+ = expand("%:p")<CR>')
keymap("n", "<Leader>cfp", ':let @+ = expand("%:t")<CR>')

-- Visual mode keymaps
keymap("v", "<Leader>p", '"_dP', { noremap = true })

-- Insert mode keymaps
keymap("i", ",", ",<C-g>u", { noremap = true })
keymap("i", ".", ".<C-g>u", { noremap = true })
keymap("i", "!", "!<C-g>u", { noremap = true })
keymap("i", "?", "?<C-g>u", { noremap = true })
keymap("i", "<C-j>", "<C-o>:m .+1<CR>", { noremap = true })
keymap("i", "<C-k>", "<C-o>:m .-2<CR>", { noremap = true })

-- Quickfix/Location List navigation
keymap("n", "<Leader>q", ":call ToggleQuickfixList()<CR>", { noremap = true })
keymap("n", "<Leader>l", ":call ToggleLocationList()<CR>", { noremap = true })
keymap("n", "<Leader>qk", ":cprev<CR>zzzv", { noremap = true })
keymap("n", "<Leader>qj", ":cnext<CR>zzzv", { noremap = true })
keymap("n", "<Leader>lk", ":lprev<CR>zzzv", { noremap = true })
keymap("n", "<Leader>lj", ":lnext<CR>zzzv", { noremap = true })

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

local last_tab = nil
local function toggle_term_tab()
	local curr_tab = vim.fn.tabpagenr()
	if curr_tab == 1 and last_tab then
		vim.cmd("tabnext " .. last_tab)
	else
		last_tab = curr_tab
		vim.cmd("tabnext 1")
	end
end
keymap("n", "<A-t>", toggle_term_tab, { noremap = true })
keymap("t", "<A-t>", toggle_term_tab, { noremap = true })
