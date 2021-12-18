syntax on                     " turn on syntax highlighting 
filetype off                  " required

set nocompatible              " be iMproved, required
set noerrorbells
" ignorecase + smartcase = only pay attention to casing when there is a
" capitalized character
set ignorecase
set smartcase
set incsearch                 " Highlight as you search
set nohlsearch                " Don't persist highlight 
set number relativenumber     " Display line numbers
set hidden                    " Hidden buffers
"set updatetime=100            " How fast writes to swap files (ms)
set signcolumn=yes
set mouse=nicr                " Mouse scrolling
" Highlight the current line 
set cursorline 

" swap files are annoying, use persistent undo instead
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo//

" save buffer whenever we navigate away from it 
set autowriteall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set smartindent                 " Auto indent on next line. 
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set softtabstop=4               " One tab == four spaces.
set nu
set nowrap
set encoding=UTF-8
set scrolloff=12                " start scrolling at n lines from the bottom
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'scrooloose/nerdcommenter'                    " Commenting (<Leader>cc)
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'vimwiki/vimwiki'                             " VimWiki 

    Plug 'tpope/vim-surround'                          " Change surrounding marks
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

    " Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Paren / quote completion
    Plug 'Raimondi/delimitMate'
    
    " Fancy start screen
    Plug 'mhinz/vim-startify'
    
    " Persistent undo tree
    Plug 'mbbill/undotree'
    
    " Docstring generator
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

    " Multiline
    "Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " Python
    Plug 'psf/black'                                   " Black python autoformatter
    
    " Git stuff
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'                     " Git status line
    Plug 'airblade/vim-gitgutter'                      " Git gutter
    
    " Smart chdir
    Plug 'airblade/vim-rooter'

    " Floaterm floating terminal inside neovim
    Plug 'voldikss/vim-floaterm'

    " Theme
    Plug 'morhetz/gruvbox'

    " Need vim nightly (0.5) for these
    Plug 'nvim-lua/popup.nvim' 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'chipsenkbeil/distant.nvim'
 
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'

    " Treesitter enables better syntax highlighting 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC completion config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p for telescope on git project files (must be in git project)
nnoremap <C-p> :lua require('telescope.builtin').git_files{}<CR>
nnoremap <M-p> :lua require('telescope.builtin').find_files{}<CR>

" Ctrl-y for telescope ripgrep on text in project 
nnoremap <C-y> :lua require('telescope.builtin').live_grep{}<CR>

" Ctrl-b for buffer search
nnoremap <C-b> :lua require('telescope.builtin').buffers{}<CR>

" <Leader>gb for git branches
nnoremap <Leader>gb :Telescope git_branches<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Reload init.vim
nnoremap <Leader>sv :PlugInstall <bar> source $MYVIMRC<CR>

" Edit init.vim
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Quit all windows
nnoremap ZA :qa<CR>

" Save current buffer
nnoremap <Leader>s :w<CR>

" visual paste won't replace lastest register
vnoremap <Leader>p "_dP

" Capital Y yanks till the end of line
nnoremap Y y$

" Keep editor centered when going through search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep cursor in the same position when line concat-ing
nnoremap J mzJ`z 

" Better undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move lines up and down and respect indent rules
inoremap <C-j> <C-o>:m .+1<CR>
inoremap <C-k> <C-o>:m .-2<CR>

" Close all buffers but the current one (helps when nvim is getting slow)
nnoremap <Leader>bc :<c-u>up <bar> %bd <bar> e#<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline theme
let g:lightline = {'colorscheme': 'gruvbox'}

" don't show the insert status line below lightline
set noshowmode 

" Gruvbox theme
colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc explorer and undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc explorer is an extension to coc.nvim. Need to run :CocInstall explorer
map <C-n> :CocCommand explorer<CR>
map <Leader>u :UndotreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hl
" I only use vertical splits, so this is enough split navigation for me
" And I can use j, k for tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-s> :vnew<CR>

" Focus current buffer in new tab
nnoremap <C-t> :tabnew %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'~/wiki/wiki/', 'path_html':'~/wiki/docs/', 'auto_diary_index': 1, 'syntax': 'markdown', 'ext': '.md'}]

" Vimwiki todo status
let g:vimwiki_listsyms = '✗○◐●✓'
nnoremap <Leader>to :e ~/wiki/wiki/todo.md<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>ga :Git amend<CR>
nnoremap <Leader>gp :Git push --force<CR>
nnoremap <Leader>gg :Git log --oneline --decorate --graph --all<CR>

" Merge conflict resolution (use `dv` in Git status menu to open vertical diff split on an unmerged file)
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader b for write + Black format for python
"nnoremap <Leader>b :w<CR> :Black<CR> :w<CR>
nnoremap <Leader>b :!black % -l 120<CR>
nnoremap <Leader>mp :set makeprg=mypy\ --ignore-missing-imports\ % <bar> make <CR> :copen <CR>

" Don't indent on ':'
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" Use google standard docstrings
let g:doge_doc_standard_python = 'google'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<M-t>'
let g:floaterm_keymap_next   = '<M-l>'
let g:floaterm_keymap_prev   = '<M-h>'
let g:floaterm_keymap_new    = '<M-n>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quickfix list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>

" Navigate between QFL entries and keep the cursor centered
nnoremap <Leader>j :cprev<CR>zzzv
nnoremap <Leader>k :cnext<CR>zzzv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Harpoon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: <Enter> adds a file to the quick menu
nnoremap <M-m> :lua require("harpoon.ui").toggle_quick_menu()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Treesitter highlights
lua require ('nvim-treesitter.configs').setup { highlight = { enable = true } }

" -------------------- LSP ---------------------------------
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Setup server specific settings
nvim_lsp.pyright.setup{ 
    on_attach = on_attach 
}
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

-- Enable LSP Colors
require("lsp-colors").setup { Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981" }
EOF
