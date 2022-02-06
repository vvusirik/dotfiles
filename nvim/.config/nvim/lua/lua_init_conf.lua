-- Lua Plugin Configs

-- Helper utils
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local map_opts = {noremap = true, silent = true}

-- Treesitter
 require ('nvim-treesitter.configs').setup { highlight = { enable = true } }

 -- LSP
local nvim_lsp = require('lspconfig')

map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', map_opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_opts)
map('n', '<space>lo', '<cmd>lua vim.diagnostic.setloclist()<CR>', map_opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bufmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
  bufmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  bufmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  bufmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
  bufmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
  bufmap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  bufmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    bufmap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    bufmap(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', map_opts)
  end

end

-- Server specific settings
nvim_lsp.clangd.setup { on_attach = on_attach }
nvim_lsp.pylsp.setup { on_attach = on_attach }
nvim_lsp.tsserver.setup { on_attach = on_attach }
nvim_lsp.gopls.setup { on_attach = on_attach }
nvim_lsp.sumneko_lua.setup { on_attach = on_attach }
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- LSP Colors
require("lsp-colors").setup { Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981" }

-- Completion
local cmp = require("cmp")
cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },

    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          { "i", "c" }
        ),

        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,

        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },

    sources = {
        { name = "nvim_lsp" },
        { name = 'ultisnips' },
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
    },

    experimental = {
        native_menu = false,
    },
}

require('nvim-web-devicons').setup { default = true; }

require('nvim-tree').setup {} 
map('n', '<C-n>', ':NvimTreeToggle<CR>', map_opts)

-- Theme
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- lualine
local gruvbox = require'lualine.themes.gruvbox-material'
require('lualine').setup({options = {theme = gruvbox}})

-- commenting
require('Comment').setup()
