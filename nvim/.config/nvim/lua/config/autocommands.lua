-- Markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(ev)
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true

		local opts = { buffer = ev.buf, silent = true }
		vim.keymap.set({ "n", "v" }, "j", "gj", opts)
		vim.keymap.set({ "n", "v" }, "k", "gk", opts)
		vim.keymap.set({ "n", "v" }, "^", "g^", opts)
		vim.keymap.set({ "n", "v" }, "0", "g0", opts)
		vim.keymap.set({ "n", "v" }, "$", "g$", opts)
	end,
})
