syntax on                     " turn on syntax highlighting 
filetype off                  " required

set nocompatible              " be iMproved, required
set noerrorbells
set incsearch
set number relativenumber     " Display line numbers
set hidden                    " Hidden buffers
set updatetime=100            " How fast writes to swap files (ms)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set smartindent                 " Auto indent on next line. 
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set nu
set nowrap

" ignorecase + smartcase = only pay attention to casing when there is a
" capitalized character
set ignorecase
set smartcase
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

    Plug 'gmarik/Vundle.vim'                           " Vundle
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
    Plug 'vifm/vifm.vim'                               " Vifm
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'scrooloose/nerdcommenter'                    " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'tpope/vim-surround'                          " Change surrounding marks
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
    Plug 'git@github.com:Valloric/YouCompleteMe.git'   " Auto completion
    
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

    " theme
    Plug 'morhetz/gruvbox'
    " Plug 'arcticicestudio/nord-vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Clear search highlight
nnoremap <Leader>n :noh<CR>

" YCM mappings
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Ctrl-p for FZF on git files (must be in git project)
nnoremap <C-p> :Files<Cr>

" Ctrl-y for FZF ripgrep on text in project 
nnoremap <C-y> :Rg<Cr>

" Reload init.vim
nnoremap <Leader>sv :PlugInstall <bar> q <bar> source $MYVIMRC<CR>

" Quit all windows
nnoremap ZA :qa<CR>

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
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none

" Gruvbox theme
colorscheme gruvbox
set background=dark

" Lightline theme
let g:lightline = {'colorscheme': 'gruvbox'}
" don't show the insert status line below lightline
set noshowmode 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:vimwiki_list = [{'path':'~/wiki/wiki/', 'path_html':'~/wiki/docs/'}]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive and Git Checkout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gs :G<CR>
nmap <Leader>gh :diffget //3<CR>
nmap <Leader>gu :diffget //2<CR>

nnoremap <Leader>gc :GCheckout<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader b for write + Black format for python
nnoremap <Leader>b :w<CR> :Black<CR> :w<CR>
let g:python_highlight_all = 1
nnoremap <Leader>mp :set makeprg=mypy\ --ignore-missing-imports\ % <bar> make<CR> :call ToggleQFList(1)<CR>

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
