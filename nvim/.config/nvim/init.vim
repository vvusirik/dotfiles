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
set signcolumn=yes
set mouse=nicr                " Mouse scrolling
set cursorline                " Highlight the current line 

" swap files are annoying, use persistent undo instead
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo//

" save buffer whenever we navigate away from it 
set autowriteall
set guifont=FiraCode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set smartindent                 " Auto indent on next line. 
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set softtabstop=4               " One tab == four spaces.
set textwidth=0                 " Don't autowrap long lines
set wrapmargin=0                " Don't autowrap long lines
set nu
set nowrap
set encoding=UTF-8
set scrolloff=12                " start scrolling at n lines from the bottom
set clipboard+=unnamedplus      " Copy/paste between vim and other programs.
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugged For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    " Personal wiki 
    Plug 'vimwiki/vimwiki'

    " Persistent undo tree
    Plug 'mbbill/undotree'

    " Change surrounding marks
    Plug 'tpope/vim-surround'

    " Snippets
    Plug 'SirVer/ultisnips'
    
    " Emmet for fast html tags
    Plug 'mattn/emmet-vim'

    " Paren / quote completion
    Plug 'Raimondi/delimitMate'

    " Fancy start screen
    Plug 'mhinz/vim-startify'

    " Docstring generator
    Plug 'kkoomen/vim-doge'

    " Git stuff
    Plug 'tpope/vim-fugitive'

    " Git gutter
    Plug 'airblade/vim-gitgutter'

    " Smart chdir
    Plug 'airblade/vim-rooter'

    " Tab utils
    Plug 'gcmt/taboo.vim'
    
    " Dispatch build and compile commands
    Plug 'tpope/vim-dispatch'

    " Theme
    Plug 'ellisonleao/gruvbox.nvim'

    " Need vim nightly (0.5) for these
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    
    " Treesitter enables better syntax highlighting 
    Plug 'nvim-treesitter/nvim-treesitter'

    " File / Buffer Navigation
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

    " File explorer and icons
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'

    " Completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    
    " Status line
    Plug 'nvim-lualine/lualine.nvim'

    " Use local neovim for remote server development
    Plug 'chipsenkbeil/distant.nvim'
 
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'

    " Commenting
    Plug 'numToStr/Comment.nvim'

    " Debug adapter protocol
    Plug 'mfussenegger/nvim-dap'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Re-source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Re-source init.vim and install any new plugins
nnoremap <Leader>siv :source $MYVIMRC <bar> :PlugInstall<CR>

" Edit init.vim
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Edit bash aliases
nnoremap <Leader>ea :e ~/.bash_aliases<CR>

" Edit nixos config
nnoremap <Leader>ec :e ~/dotfiles/nixos/configuration.nix<CR>

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

" Go to open / close brace with tab instead of %
nnoremap <Tab> %

" Better undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move lines up and down and respect indent rules
inoremap <C-j> <C-o>:m .+1<CR>
inoremap <C-k> <C-o>:m .-2<CR>

" Current word becomes search object without moving cursor
" (Useful when combined with cgn for multicursor like replacements of words)
nnoremap + *N
nnoremap - *Ncgn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the insert status line below lightline
set noshowmode 

" Gruvbox theme
set termguicolors
set background=dark
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

" Focus current buffer in new tab and set the tab name
nnoremap <C-t> :TabooOpen 

" rename tab
nnoremap <Leader>tr :TabooRename 

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit snippets for current file type
nnoremap <Leader>es :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger = '<F10>'
let g:UltiSnipsJumpForwardTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UndoTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>u :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'~/wiki/wiki/', 'path_html':'~/wiki/docs/', 'auto_diary_index': 1, 'syntax': 'markdown', 'ext': '.md'}]

" Vimwiki todo status
let g:vimwiki_listsyms = '✗○◐●✓'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>ga :Git amend<CR>
nnoremap <Leader>gp :Git submit<CR>
nnoremap <Leader>gg :Git log --oneline --decorate --graph --all<CR>

" Telescope to switch git branches
nnoremap <Leader>gb :Telescope git_branches<CR>

" Merge conflict resolution (use `dv` in Git status menu to open vertical diff split on an unmerged file)
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dispatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Can also use `<CR>
nnoremap <Leader>d :Dispatch<CR>
" Spawn in background
nnoremap <Leader>db :Dispatch!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't indent on ':'
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" Use google standard docstrings
let g:doge_doc_standard_python = 'google'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quickfix / Location List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open / close q/l list
nnoremap <Leader>q :call ToggleQuickfixList()<CR>
nnoremap <Leader>l :call ToggleLocationList()<CR>

" Navigate between QFL entries and keep the cursor centered
nnoremap <Leader>qk :cprev<CR>zzzv
nnoremap <Leader>qj :cnext<CR>zzzv
nnoremap <Leader>lk :lprev<CR>zzzv
nnoremap <Leader>lj :lnext<CR>zzzv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua Plugin Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.config/nvim/lua/init.lua
lua require('init')
