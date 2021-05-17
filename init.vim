syntax on                     " turn on syntax highlighting 
filetype off                  " required

set autochdir
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
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'scrooloose/nerdcommenter'                    " Commenting (<Leader>cc)
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'tpope/vim-surround'                          " Change surrounding marks
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
    "Plug 'git@github.com:Valloric/YouCompleteMe.git'   " YCM Auto completion and tagging

    " Cheatsheet
    "Plug 'dbeniamine/cheat.sh-vim'

    " Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Fancy start screen
    Plug 'mhinz/vim-startify'
    
    " Persistent undo tree
    Plug 'mbbill/undotree'
    
    " Python
    Plug 'psf/black'                                   " Black python autoformatter
    Plug 'vim-python/python-syntax'                    " Python highlighting

    " fzf for fuzzy search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    " Git stuff
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'                     " Git status line
    Plug 'airblade/vim-gitgutter'                      " Git gutter
    Plug 'stsewd/fzf-checkout.vim'

    " Floaterm floating terminal inside neovim
    Plug 'voldikss/vim-floaterm'

    " theme
    Plug 'morhetz/gruvbox'

    " Need vim nightly (0.5) for these
    " Plug 'nvim-lua/popup.nvim' 
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'

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
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p for FZF on git project files (must be in git project)
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <C-p> :ProjectFiles<CR>

" Ctrl-y for FZF ripgrep on text in project 
nnoremap <C-y> :Rg<Cr>

" Ctrl-b for buffer search
nnoremap <C-b> :Buffers<Cr>

" Telescope mappings, too unstable for daily use
" nnoremap <Leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <Leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <Leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <Leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Clear search highlight
nnoremap <Leader>n :noh<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none

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

" Uncomment to autostart the NERDTree
" map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=38
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

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

" Remap tab navigation to just CTRL + jk
nnoremap <C-t> :tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'~/wiki/wiki/', 'path_html':'~/wiki/docs/', 'auto_diary_index': 1}]

" Vimwiki todo status
let g:vimwiki_listsyms = '✗○◐●✓'
nnoremap <Leader>to :e ~/wiki/wiki/todo.wiki<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive and Git Checkout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gs :G<CR>
nmap <Leader>gj :diffget //2<CR>
nmap <Leader>gk :diffget //3<CR>

nnoremap <Leader>gc :GCheckout<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader b for write + Black format for python
nnoremap <Leader>b :w<CR> :Black<CR> :w<CR>
let g:python_highlight_all = 1
nnoremap <Leader>mp :set makeprg=mypy\ --ignore-missing-imports\ % <bar> make <CR> copen <CR>

" Comment/uncomment block
vnoremap <silent> # :s/^/# /<cr>:noh<cr>
vnoremap <silent> -# :s/^# //<cr>:noh<cr>

" Comment line
nnoremap <Leader># :s/^/# /<cr>:noh<cr>
nnoremap <Leader>-# :s/^# //<cr>:noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<M-t>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quickfix list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :call ToggleQFList(1)<CR>
let g:qf_global_visible = 0
fun! ToggleQFList(global)
    if g:qf_global_visible == 1
        let g:qf_global_visible = 0
        cclose
    else
        let g:qf_global_visible = 1
        copen
    endif
endfun

" Navigate between QFL entries
nnoremap <Leader>j :cprev<CR>
nnoremap <Leader>k :cnext<CR>

" Enable Treesitter highlights
lua require ('nvim-treesitter.configs').setup { highlight = { enable = true } }

" -------------------- LSP ---------------------------------
lua require('lspconfig').pyright.setup{}

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

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
