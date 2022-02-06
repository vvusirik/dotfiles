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
" Vim Plugged 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'vimwiki/vimwiki'                             " VimWiki 

    Plug 'tpope/vim-surround'                          " Change surrounding marks

    " Paren / quote completion
    Plug 'Raimondi/delimitMate'
    
    " Fancy start screen
    Plug 'mhinz/vim-startify'
    
    " Persistent undo tree
    Plug 'mbbill/undotree'
    
    " Docstring generator
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

    " Git stuff
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'                      " Git gutter
    
    " Smart chdir
    Plug 'airblade/vim-rooter'

    " Theme
    Plug 'ellisonleao/gruvbox'

    " --- Need vim nightly (0.5) for these
    " Lua utils
    Plug 'nvim-lua/popup.nvim' 
    Plug 'nvim-lua/plenary.nvim'

    " File navigation / fuzzy search 
    Plug 'ThePrimeagen/harpoon'
    Plug 'nvim-telescope/telescope.nvim'

    " Remove development
    Plug 'chipsenkbeil/distant.nvim'

    " Status line
    Plug 'nvim-lualine/lualine.nvim'

    " File tree and icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    " Treesitter enables better syntax highlighting 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'

    " Completion
    Plug 'hrsh7th/nvim-cmp'

    " Commenting
    Plug 'numToStr/Comment.nvim'
call plug#end()

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
nnoremap <Leader>sv source $MYVIMRC<CR>
nnoremap <Leader>siv source $MYVIMRC <bar> :PlugInstall<CR>

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

" Change the current word
nnoremap - *Ncgn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark " or light if you want light mode
colorscheme gruvbox

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
" Don't indent on ':'
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" Use google standard docstrings
let g:doge_doc_standard_python = 'google'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:floaterm_keymap_toggle = '<M-t>'
"let g:floaterm_keymap_next   = '<M-l>'
"let g:floaterm_keymap_prev   = '<M-h>'
"let g:floaterm_keymap_new    = '<M-n>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quickfix / Location list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

" Navigate between QFL entries and keep the cursor centered
nnoremap <Leader>qk :cprev<CR>zzzv
nnoremap <Leader>qj :cnext<CR>zzzv
nnoremap <Leader>lk :lprev<CR>zzzv
nnoremap <Leader>lj :lnext<CR>zzzv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Harpoon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: <Enter> adds a file to the quick menu
nnoremap <M-m> :lua require("harpoon.ui").toggle_quick_menu()<CR>


lua << EOF
require("lua_init_conf")
EOF
