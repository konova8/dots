-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

-- Tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.expandtab = true

vim.o.smartindent = true

-- Wrap text
vim.o.wrap = false

-- Undo stuff
vim.o.undofile = true

-- Searching
vim.o.hlsearch = false
vim.o.incsearch = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable break indent
vim.o.breakindent = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Keep space from top and bottom of the screen
vim.o.scrolloff = 8
-- Max 80 char of text
vim.o.colorcolumn = "80"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Terminal gui Colors
vim.o.termguicolors = true
