return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        null_ls.setup({
            sources = {
                formatting.prettierd,
                -- Formatting with black
                formatting.black.with({
                    -- optional: specify extra_args or python path
                    command = "/opt/homebrew/bin/black", -- full path here
                    extra_args = { "--fast" },
                }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>",
                        { noremap = true, silent = true })
                end
            end,
        })
    end
}
