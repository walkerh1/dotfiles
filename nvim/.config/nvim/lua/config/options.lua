-- Disable NetRw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Allow different filetypes to override these options in after/ftplugin/*.lua
vim.cmd 'filetype plugin indent on'

-- Auto-wrap comments on format according to textwidth specified in after/ftplugin/*.lua
vim.opt.formatoptions:append 'cro'

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Gutter settings
vim.opt.number = true -- include line number
vim.opt.relativenumber = true -- non-current lines have relative numbers
vim.opt.signcolumn = 'yes:2' -- persist gutter width

-- Default tab settings (language overrides in after/ftplugin/)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Preserve indentation when wrapping lines
vim.opt.breakindent = true

-- Do not wrap text
vim.opt.wrap = false

-- Do not use swap files or backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Persist undo history
vim.opt.undofile = true

-- Search settings
vim.opt.hlsearch = true -- highlight matches
vim.opt.incsearch = true -- incrementally match
vim.opt.ignorecase = true -- ignore case
vim.opt.smartcase = true -- unless uppercase letters are in the query

-- Enable 24-bit color in the terminal UI
vim.opt.termguicolors = true

-- Cursor offset from top and bottom of page
vim.opt.scrolloff = 10

-- Disable alternative nvim providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Show current buffer's file path relative to cwd in winbar
vim.opt.winbar = '%f'
