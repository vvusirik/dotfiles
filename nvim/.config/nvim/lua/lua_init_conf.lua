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

-- lualine
local gruvbox = require'lualine.themes.gruvbox-material'
require('lualine').setup({options = {theme = gruvbox}})

-- FTerm

-- Toggle floating terminal
map('n', '<M-t>', '<cmd>lua require("FTerm").toggle()<CR>', map_opts)
map('t', '<M-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>', map_opts)

-- Attach to the float session in tmux floating terminal (good for persistence)
function FloatAttach()
    require('FTerm').run('tmux a -t float || tmux new -s float')
end
map('n', '<M-a>', '<cmd>lua FloatAttach()<CR>', map_opts)

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

-- Floating windows for information
function DapScope()
    local widgets = require('dap.ui.widgets')
    local window = widgets.cursor_float(widgets.scopes)
    window.open()
end

function DapFrames()
    local widgets = require('dap.ui.widgets')
    local window = widgets.cursor_float(widgets.frames)
    window.open()
end

map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', map_opts)
map('n', '<leader>dn', ':lua require"dap".continue()<CR>', map_opts)
map('n', '<leader>dc', ':lua require"dap".close()<CR>', map_opts)
map('n', '<leader>do', ':lua require"dap".step_over()<CR>', map_opts)
map('n', '<leader>di', ':lua require"dap".step_into()<CR>', map_opts)
map('n', '<leaer>dx', ':lua require"dap".step_out()<CR>', map_opts)
map('n', '<leader>dr', ':lua require"dap".repl.open()<CR><C-w>ji', map_opts)
map('n', '<leader>d?', ':lua DapScope()<CR>', map_opts)
map('n', '<leader>df', ':lua DapFrames()<CR>', map_opts)

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

-- Ctrl-y Ripgrep for file search
map('n', '<C-p>', ':lua FindFilesTelescope()<CR>', map_opts)

-- Ctrl-y Ripgrep for live search
map('n', '<C-y>', ':lua require("telescope.builtin").live_grep()<CR>', map_opts)

-- Ctrl-b for buffer search
map('n', '<C-b>', ':lua require("telescope.builtin").buffers()<CR>', map_opts)

-- Vimwiki window toggles
function CreateWindow(title)
    local width = 60
    local height = 10
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    local bufnr = vim.api.nvim_create_buf(false, false)

    local Harpoon_win_id, win = require'plenary.popup'.create(bufnr, {
        title = title,
        highlight = title .. "Window",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    vim.api.nvim_win_set_option(
        win.border.win_id,
        "winhl",
        "Normal:HarpoonBorder"
    )

    return {
        bufnr = bufnr,
        win_id = Harpoon_win_id,
    }
end

map('n', '<M-m>', ':lua CreateWindow()<CR>', map_opts)


