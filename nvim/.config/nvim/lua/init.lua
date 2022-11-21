-- Lua Plugin Configs

-- Helper utils
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local map_opts = {noremap = true, silent = true}

function FloatWindow(file)
    local win = vim.api.nvim_get_current_win()
    local height = vim.api.nvim_win_get_height(win)
    local width = vim.api.nvim_win_get_width(win)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {relative='win', row=5, col=10, width=width - 20, height=height - 10})
    vim.api.nvim_command('e ' .. file)
end

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

require('nvim-tree').setup {
    view = {
        adaptive_size = true
    }
}
map('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', map_opts)

-- lualine
local gruvbox = require'lualine.themes.gruvbox-material'
require('lualine').setup({options = {theme = gruvbox}})

-- Terminal
-- Switch to first tab (conventially where I keep my nvim term) and enter insert mode
map('n', '<M-t>', '1gt<CR>a', map_opts)
-- Escape terminal to normal mode
map('t', '<Esc>', '<C-\\><C-N>', map_opts)

-- Switch from terminal back to last active tab
vim.api.nvim_create_autocmd("TabLeave",  {
    pattern = "*",
    callback = function()
        map('t', '<M-t>', '<cmd>tabn ' .. vim.api.nvim_tabpage_get_number(0) .. '<CR>', map_opts)
    end
})

-- Go to file under cursor in a vertical split
map('n', '<C-W>f', '<C-w>vgf', map_opts)
map('n', '<C-W><C-F>', '<C-w>vgf', map_opts)

-- Open vimwiki todo in floating window
map('n', '<Leader>to', '<cmd>lua FloatWindow("~/wiki/wiki/todo.md")<CR>', map_opts)

-- Comment
require('Comment').setup()

-- DAP
-- Python DAP
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `env` folder in the current directly and uses the python within.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/env/bin/python') == 1 then
        return cwd .. '/env/bin/python'
      else
        return '/usr/bin/python3'
      end

      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable:
      -- local venv = os.getenv("VIRTUAL_ENV")
      -- command = vim.fn.getcwd() .. string.format("%s/bin/python",venv)
    end;
  },
}

-- Telescope
local Job = require'plenary.job'

-- Use Telescope's git_files if we're in a git directory, else use find_files
function FindFilesTelescope()
    local result = Job:new({
      command = 'git',
      args = { 'rev-parse', '--is-inside-work-tree' },
    }):sync()

    local count = 0
    for key, val in pairs(result) do
        if val then
           require'telescope.builtin'.git_files()
        end
        count = count + 1
    end

    if count == 0 then
        require'telescope.builtin'.find_files()
    end
end

-- Alt-w to change worktree
map('n', '<M-w>', ':lua require("custom_pickers").worktrees()<CR>', map_opts)

-- Ctrl-y Ripgrep for file search
map('n', '<C-p>', ':lua FindFilesTelescope()<CR>', map_opts)

-- Ctrl-y Ripgrep for live search
map('n', '<C-y>', ':lua require("telescope.builtin").live_grep()<CR>', map_opts)

-- Ctrl-b for buffer search
map('n', '<C-b>', ':lua require("telescope.builtin").buffers()<CR>', map_opts)
