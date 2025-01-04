-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options configuration for Neovim using Lua
local set = vim.opt

-- General settings
set.incsearch = true  -- Highlight matches as you type
set.number = true  -- Show absolute line numbers
set.relativenumber = true  -- Show relative line numbers
set.hidden = true  -- Enable hidden buffers
set.signcolumn = 'yes'  -- Always show sign column
set.splitbelow = true  -- Split below
set.splitright = true  -- Split right
set.mouse = 'nicr'  -- Enable mouse scrolling in normal, insert, and command modes
set.cursorline = true  -- Highlight current line

-- Undo and backup
set.swapfile = false  -- Disable swap files
set.backup = false  -- Disable backups
set.undofile = true  -- Enable persistent undo
set.undodir = vim.fn.expand('~/.vim/undo')  -- Persistent undo directory

-- Auto write
set.autowriteall = true  -- Auto-save when switching buffers

-- Indentation
set.expandtab = true  -- Use spaces instead of tabs
set.smarttab = true  -- Smart tab behavior
set.smartindent = true  -- Auto indent new lines
set.shiftwidth = 4  -- Indentation width
set.tabstop = 4  -- Tab width
set.softtabstop = 4  -- Tab width for editing

-- Scrolling
set.scrolloff = 12  -- Keep 12 lines visible above/below cursor

-- Clipboard
set.clipboard:append('unnamedplus')  -- Enable clipboard integration

-- Colors and theming
set.termguicolors = true  -- Enable 24-bit colors
set.background = 'dark'  -- Set background to dark