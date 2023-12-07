-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- This source all lua files inside plugins folder inside lua folder
-- So you don't have to require everything by hand
require("lazy").setup("plugins")

-- [[ Lua files ]]
require('vim-options')
require('custom-commands')
require('keymap')
require('highlight-yank')
require('autoformat')
