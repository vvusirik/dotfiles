-- Keymaps configuration for Neovim using Lua

-- Function to simplify keymap setting
local keymap = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts["noremap"] = true
	opts["silent"] = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal mode keymaps
keymap("n", "<Leader>sv", ":source $MYVIMRC<CR>", { desc = "Source My Vimrc" })
keymap("n", "<Leader>siv", ":source $MYVIMRC | Lazy sync<CR>", { desc = "Source My Vimrc & Lazy Sync" })
keymap("n", "<Leader>ev", ":e $MYVIMRC<CR>", { desc = "Edit My Vimrc" })
keymap("n", "<Leader>ea", ":e ~/.bash_aliases<CR>", { desc = "Edit Bash Aliases" })
keymap("n", "<Leader>en", ":e ~/dotfiles/navi/<CR>", { desc = "Edit Navi Cheatsheets" })
keymap("n", "ZA", ":qa<CR>", { desc = "Quit All" })
keymap("n", "<Leader>s", ":w<CR>", { desc = "Save File" })
keymap("n", "Y", "y$", { desc = "Yank to End of Line" })
keymap("n", "n", "nzzzv", { desc = "Next Search Result Centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous Search Result Centered" })
keymap("n", "J", "mzJ`z", { desc = "Join Line (keep cursor pos)" })
keymap("n", "<Tab>", "%", { desc = "Jump to Matching Bracket" })
keymap("n", "+", "*N", { desc = "Search Word Forwards" })
keymap("n", "-", "*Ncgn", { desc = "Search Word Backwards" })

-- copy file paths
keymap("n", "<Leader>crp", ':let @+ = expand("%")<CR>', { desc = "Copy Relative Path" })
keymap("n", "<Leader>cap", ':let @+ = expand("%:p")<CR>', { desc = "Copy Absolute Path" })
keymap("n", "<Leader>cfp", ':let @+ = expand("%:t")<CR>', { desc = "Copy Filename" })

-- Visual mode keymaps
keymap("v", "<Leader>p", '"_dP', { desc = "Paste Without YWipe" })

-- Insert mode keymaps
keymap("i", ",", ",<C-g>u")
keymap("i", ".", ".<C-g>u")
keymap("i", "!", "!<C-g>u")
keymap("i", "?", "?<C-g>u")
keymap("i", "<C-j>", "<C-o>:m .+1<CR>", { desc = "Move Line Down" })
keymap("i", "<C-k>", "<C-o>:m .-2<CR>", { desc = "Move Line Up" })

-- Quickfix/Location List navigation
keymap("n", "<Leader>q", ":call ToggleQuickfixList()<CR>", { desc = "Toggle Quickfix List" })
keymap("n", "<Leader>l", ":call ToggleLocationList()<CR>", { desc = "Toggle Location List" })
keymap("n", "<Leader>qk", ":cprev<CR>zzzv", { desc = "Previous Quickfix Item" })
keymap("n", "<Leader>qj", ":cnext<CR>zzzv", { desc = "Next Quickfix Item" })
keymap("n", "<Leader>lk", ":lprev<CR>zzzv", { desc = "Previous Location Item" })
keymap("n", "<Leader>lj", ":lnext<CR>zzzv", { desc = "Next Location Item" })

-- reload
keymap("n", "<Leader>r", ":e!<CR>", { desc = "Reload File" })

-- Terminal
keymap("t", "<esc>", "<C-\\><C-n>", { buffer = 0, silent = true, desc = "Exit Terminal Mode" })

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
keymap("n", "<A-t>", toggle_term_tab)
keymap("t", "<A-t>", toggle_term_tab)
